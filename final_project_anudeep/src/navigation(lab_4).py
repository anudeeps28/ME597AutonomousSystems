#!/usr/bin/env python3

#########################################################################################
#   Library imports
#########################################################################################

import sys
import os
import numpy as np
import rospy
import tf
import math
import yaml
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.cm as cm

from PIL import Image, ImageOps
from graphviz import Graph
from copy import deepcopy, copy
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped, PoseWithCovarianceStamped, Pose, Twist


#########################################################################################
#   Class that defines the map file to be used for navigation
#########################################################################################

class Map():
    def __init__(self, map_name):
        self.map_im, self.map_df, self.limits = self.__open_map(map_name)
        self.image_array = self.__get_obstacle_map(self.map_im, self.map_df)
    
    def __repr__(self):
        fig, ax = plt.subplots(dpi=150)
        ax.imshow(self.image_array,extent=self.limits, cmap=cm.gray)
        ax.plot()
        return ""
        
    def __open_map(self,map_name):
        # Open the YAML file which contains the map name and other
        # configuration parameters

        # SETTING THE MAP LOCATION HERE
        root_path = os.path.expanduser('~') + '/catkin_ws/src/lab_4_pkg/maps'
        f = open(os.path.join(root_path,'map.yaml'))
        map_df = pd.json_normalize(yaml.safe_load(f))
        # Open the map image
        map_name = map_df.image[0]
        im = Image.open(os.path.join(root_path, map_name))
        size =800 , 800
        im.thumbnail(size)
        im = ImageOps.grayscale(im)
        # Get the limits of the map. This will help to display the map
        # with the correct axis ticks.
        xmin = map_df.origin[0][0]
        xmax = map_df.origin[0][0] + im.size[0] * map_df.resolution[0]
        ymin = map_df.origin[0][1]
        ymax = map_df.origin[0][1] + im.size[1] * map_df.resolution[0]

        return im, map_df, [xmin,xmax,ymin,ymax]

    def __get_obstacle_map(self,map_im, map_df):
        img_array = np.reshape(list(self.map_im.getdata()),(self.map_im.size[1],self.map_im.size[0]))
        up_thresh = self.map_df.occupied_thresh[0]*255
        low_thresh = self.map_df.free_thresh[0]*255

        for j in range(self.map_im.size[0]):
            for i in range(self.map_im.size[1]):
                if img_array[i,j] > up_thresh:
                    img_array[i,j] = 255
                else:
                    img_array[i,j] = 0
        return img_array

#########################################################################################
#   Classes that define a queue, node and a tree to be used by the map processor
#########################################################################################

class Queue():
    def __init__(self, init_queue = []):
        self.queue = copy(init_queue)
        self.start = 0
        self.end = len(self.queue)-1
    
    def __len__(self):
        numel = len(self.queue)
        return numel
    
    def __repr__(self):
        q = self.queue
        tmpstr = ""
        for i in range(len(self.queue)):
            flag = False
            if(i == self.start):
                tmpstr += "<"
                flag = True
            if(i == self.end):
                tmpstr += ">"
                flag = True
            
            if(flag):
                tmpstr += '| ' + str(q[i]) + '|\n'
            else:
                tmpstr += ' | ' + str(q[i]) + '|\n'
            
        return tmpstr
    
    def __call__(self):
        return self.queue
    
    def initialize_queue(self,init_queue = []):
        self.queue = copy(init_queue)
    
    def sort(self,key=str.lower):
        self.queue = sorted(self.queue,key=key)
        
    def push(self,data):
        self.queue.append(data)
        self.end += 1
    
    def pop(self):
        p = self.queue.pop(self.start)
        self.end = len(self.queue)-1
        return p
    
class Node():
    def __init__(self,name):
        self.name = name
        self.children = []
        self.weight = []
        
    def __repr__(self):
        return self.name
        
    def add_children(self,node,w=None):
        if w == None:
            w = [1]*len(node)
        self.children.extend(node)
        self.weight.extend(w)
    
class Tree():
    def __init__(self,name):
        self.name = name
        self.root = 0
        self.end = 0
        self.g = {}
        self.g_visual = Graph('G')
    
    def __call__(self):
        for name,node in self.g.items():
            if(self.root == name):
                self.g_visual.node(name,name,color='red')
            elif(self.end == name):
                self.g_visual.node(name,name,color='blue')
            else:
                self.g_visual.node(name,name)
            for i in range(len(node.children)):
                c = node.children[i]
                w = node.weight[i]
                #print('%s -> %s'%(name,c.name))
                if w == 0:
                    self.g_visual.edge(name,c.name)
                else:
                    self.g_visual.edge(name,c.name,label=str(w))
        return self.g_visual
    
    def add_node(self, node, start = False, end = False):
        self.g[node.name] = node
        if(start):
            self.root = node.name
        elif(end):
            self.end = node.name
            
    def set_as_root(self,node):
        # These are exclusive conditions
        self.root = True
        self.end = False
    
    def set_as_end(self,node):
        # These are exclusive conditions
        self.root = False
        self.end = True   


#########################################################################################
#   Class that processes the input map file and converts it to a graph
#########################################################################################

class MapProcessor():
    def __init__(self,name):
        self.map = Map(name)
        self.inf_map_img_array = np.zeros(self.map.image_array.shape)
        self.map_graph = Tree(name)
    
    def __modify_map_pixel(self,mapx_array,i,j,value,absolute):
        if( (i >= 0) and 
            (i < map_array.shape[0]) and 
            (j >= 0) and
            (j < map_array.shape[1]) ):
            if absolute:
                map_array[i][j] = value
            else:
                map_array[i][j] += value 
    
    def __inflate_obstacle(self,kernel,map_array,i,j,absolute):
        dx = int(kernel.shape[0]//2)
        dy = int(kernel.shape[1]//2)
        if (dx == 0) and (dy == 0):
            self.__modify_map_pixel(map_array,i,j,kernel[0][0],absolute)
        else:
            for k in range(i-dx,i+dx):
                for l in range(j-dy,j+dy):
                    self.__modify_map_pixel(map_array,k,l,kernel[k-i+dx][l-j+dy],absolute)
        
    def inflate_map(self,kernel,absolute=True):
        # Perform an operation like dilation, such that the small wall found during the mapping process
        # are increased in size, thus forcing a safer path.
        self.inf_map_img_array = np.zeros(self.map.image_array.shape)
        for i in range(self.map.image_array.shape[0]):
            for j in range(self.map.image_array.shape[1]):
                if self.map.image_array[i][j] == 0:
                    self.__inflate_obstacle(kernel,self.inf_map_img_array,i,j,absolute)
        r = np.max(self.inf_map_img_array)-np.min(self.inf_map_img_array)
        if r == 0:
            r = 1
        self.inf_map_img_array = (self.inf_map_img_array - np.min(self.inf_map_img_array))/r
                
    def get_graph_from_map(self):
        # Create the nodes that will be part of the graph, considering only valid nodes or the free space
        for i in range(self.map.image_array.shape[0]):
            for j in range(self.map.image_array.shape[1]):
                if self.inf_map_img_array[i][j] == 0:
                    node = Node('%d,%d'%(i,j))
                    self.map_graph.add_node(node)
        # Connect the nodes through edges
        for i in range(self.map.image_array.shape[0]):
            for j in range(self.map.image_array.shape[1]):
                if self.inf_map_img_array[i][j] == 0:                    
                    if (i > 0):
                        if self.inf_map_img_array[i-1][j] == 0:
                            # add an edge up
                            child_up = self.map_graph.g['%d,%d'%(i-1,j)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_up],[1])
                    if (i < (self.map.image_array.shape[0] - 1)):
                        if self.inf_map_img_array[i+1][j] == 0:
                            # add an edge down
                            child_dw = self.map_graph.g['%d,%d'%(i+1,j)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_dw],[1])
                    if (j > 0):
                        if self.inf_map_img_array[i][j-1] == 0:
                            # add an edge to the left
                            child_lf = self.map_graph.g['%d,%d'%(i,j-1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_lf],[1])
                    if (j < (self.map.image_array.shape[1] - 1)):
                        if self.inf_map_img_array[i][j+1] == 0:
                            # add an edge to the right
                            child_rg = self.map_graph.g['%d,%d'%(i,j+1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_rg],[1])
                    if ((i > 0) and (j > 0)):
                        if self.inf_map_img_array[i-1][j-1] == 0:
                            # add an edge up-left 
                            child_up_lf = self.map_graph.g['%d,%d'%(i-1,j-1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_up_lf],[np.sqrt(2)])
                    if ((i > 0) and (j < (self.map.image_array.shape[1] - 1))):
                        if self.inf_map_img_array[i-1][j+1] == 0:
                            # add an edge up-right
                            child_up_rg = self.map_graph.g['%d,%d'%(i-1,j+1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_up_rg],[np.sqrt(2)])
                    if ((i < (self.map.image_array.shape[0] - 1)) and (j > 0)):
                        if self.inf_map_img_array[i+1][j-1] == 0:
                            # add an edge down-left 
                            child_dw_lf = self.map_graph.g['%d,%d'%(i+1,j-1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_dw_lf],[np.sqrt(2)])
                    if ((i < (self.map.image_array.shape[0] - 1)) and (j < (self.map.image_array.shape[1] - 1))):
                        if self.inf_map_img_array[i+1][j+1] == 0:
                            # add an edge down-right
                            child_dw_rg = self.map_graph.g['%d,%d'%(i+1,j+1)]
                            self.map_graph.g['%d,%d'%(i,j)].add_children([child_dw_rg],[np.sqrt(2)])                    
        
    def gaussian_kernel(self, size, sigma=1):
        size = int(size) // 2
        x, y = np.mgrid[-size:size+1, -size:size+1]
        normal = 1 / (2.0 * np.pi * sigma**2)
        g =  np.exp(-((x**2 + y**2) / (2.0*sigma**2))) * normal
        r = np.max(g)-np.min(g)
        sm = (g - np.min(g))*1/r
        return sm
    
    def rect_kernel(self, size, value):
        m = np.ones(shape=(size,size))
        return m
    
    def draw_path(self,path):
        path_tuple_list = []
        path_array = copy(self.inf_map_img_array)
        for idx in path:
            tup = tuple(map(int, idx.split(',')))
            path_tuple_list.append(tup)
            path_array[tup] = 0.5
        return path_array

#########################################################################################
#   Class that defines the A* planning algorithm
#########################################################################################

class AStar():
    def __init__(self,in_tree):
        self.in_tree = in_tree
        self.q = Queue()
        self.dist = {name:np.Inf for name,node in in_tree.g.items()}
        self.h = {name:0 for name,node in in_tree.g.items()}
        
        for name,node in in_tree.g.items():
            start = tuple(map(int, name.split(',')))
            end = tuple(map(int, self.in_tree.end.split(',')))
            self.h[name] = np.sqrt((end[0]-start[0])**2 + (end[1]-start[1])**2)
        
        self.via = {name:0 for name,node in in_tree.g.items()}
        for __,node in in_tree.g.items():
            self.q.push(node)
     
    def __get_f_score(self,node):
        # Place code here (remove the pass 
        # statement once you start coding)
        idx = node.name
        return self.dist[idx] + self.h[idx]
    
    def solve(self, sn, en):

        self.dist[sn.name] = 0
        while len(self.q) > 0:
            # Sorting the queue by f score and setting the current node as the 
            # node with lowest f score
            self.q.sort(key=self.__get_f_score)
            curr_node = self.q.pop()

            # Breaking the loop if current node is the end node
            if curr_node.name == en.name:
                break

            # Looping through the neighbouring nodes
            for i in range(len(curr_node.children)):
                c = curr_node.children[i]
                w = curr_node.weight[i]

                new_dist = self.dist[curr_node.name] + w

                if new_dist < self.dist[c.name]:
                    self.dist[c.name] = new_dist
                    self.via[c.name] = curr_node.name
#                elif new_dist > self.dist[c.name]:
#                    new_dist = self.dist[c.name]
#                    self.via[curr_node.name] = c.name

#        # Setting distance of start node as zero 
#        self.dist[sn.name] = 0
#
#        # Creating an open and closed list to store the traversed nodes and nodes 
#        # that have not yet been visited
#        open_list = []
#        open_list.append(sn)
#        closed_list = []
#
#        while len(self.q) > 0:
#            # Sorting the queue according to f score
#            self.q.sort(key = self.__get_f_score)
#
#            # Taking the node with lowest f score and setting it as current node
#            curr_node = self.q.pop()
#
#            # Checking if current node is end node
#            if curr_node.name == en.name:
#                break
#
#            # Adding current node to closed list and looping through it's neighbours
#            closed_list.append(curr_node)
#            for i in range(len(curr_node.children)):
#                c = curr_node.children[i]
#                w = curr_node.weight[i]
#
#                new_dist = self.dist[c.name] + w
#                if new_dist < self.dist[curr_node.name] and c.name in closed_list:
#                    self.dist[c.name] = new_dist
#                    # Now set the current node as the neighbour's parent
#                    curr_node = c
#                
#                elif self.dist[curr_node.name] < new_dist and c.name in open_list:
#                    new_dist = self.dist[curr_node.name]
#                    # Now set the current node as the neighbour's parent
#                    c = curr_node
#
#                elif (c.name not in open_list) and (c.name not in closed_list):
#                    open_list.append(c)
#                    # Set g value of neighbour 
#                    self.dist[c.name] = new_dist
#                    self.via[c.name] = curr_node

    def reconstruct_path(self,sn,en):
        path = []
        dist = 0

        start_key = sn.name
        end_key = en.name
        dist = self.dist[end_key]
        u = end_key
        path = [u]
        
        while u != start_key:
            u = self.via[u]
            path.append(u)
        path.reverse() 
        
        return path,dist


#########################################################################################
#   Class that defines the navigation methodology
#########################################################################################

class Navigation:
    """! Navigation node class.
    This class should server as a template to implement the path planning and 
    path follower components to move the turtlebot from position A to B.
    """
    def __init__(self, node_name='Navigation'):
        """! Class constructor.
        @param  None.
        @return An instance of the Navigation class.
        """
        # ROS related variables
        self.node_name = node_name
        self.rate = 0
        # Path planner/follower related variables
        self.path = Path()
        self.goal_pose = PoseStamped()
        self.ttbot_pose = PoseStamped()

        # PID Control variables
        self.integral = 0
        self.derivative = 0
        self.previous_error = 0
        self.output = 0
        self.data = 0


    def init_app(self):
        """! Node intialization.
        @param  None
        @return None.
        """
        # ROS node initilization
        
        rospy.init_node(self.node_name, anonymous=True)
        self.rate = rospy.Rate(10)
        # Subscribers
        rospy.Subscriber('/move_base_simple/goal', PoseStamped, self.__goal_pose_cbk, queue_size=1)
        rospy.Subscriber('/amcl_pose', PoseWithCovarianceStamped, self.__ttbot_pose_cbk, queue_size=1)
        # Publishers
        self.path_pub = rospy.Publisher('global_plan', Path, queue_size=1)
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)

    def __goal_pose_cbk(self, data):
        """! Callback to catch the goal pose.
        @param  data    PoseStamped object from RVIZ.
        @return None.
        """
        self.goal_pose = data
        rospy.loginfo('goal_pose:{:.4f},{:.4f}'.format(self.goal_pose.pose.position.x,self.goal_pose.pose.position.y))

    def __ttbot_pose_cbk(self, data):
        """! Callback to catch the position of the vehicle.
        @param  data    PoseWithCovarianceStamped object from amcl.
        @return None.
        """
        # TODO: MAKE SURE YOUR POSITION ESTIMATE IS GOOD ENOUGH.
        self.ttbot_pose = data.pose
        cov = data.pose.covariance

        # Looping through the covariance list and checking if estimate is good enough
        for idx in cov:
            # Setting 0.1 as the threshold
            if idx > 0.1:
                rospy.loginfo("Position estimate is not good enough")
            else:
                rospy.loginfo("Position estimate is good enough!")

        #self.ttbot_pose.header = self.data.header
        #self.ttbot_pose.pose = self.data.pose.pose

        rospy.loginfo('ttbot_pose:{:.4f},{:.4f}'.format(self.ttbot_pose.pose.position.x,self.ttbot_pose.pose.position.y))
        rospy.loginfo('ttbot_pose:{}'.format(cov))


    def graph_from_map(self, map):
        """! This function generates a graph from the input map
        @param  map    Saved input map file for performing navigation in.
        @return map_obj Map processor class object.
        """

        mp = MapProcessor(map)
        kr = mp.rect_kernel(800,800) # (3,1) tha pehele
        mp.inflate_map(kr, True)
        mp.get_graph_from_map()

        return mp
    
    def a_star_path_planner(self,start_pose,end_pose):
        """! A Start path planner.
        @param  start_pose    PoseStamped object containing the start of the path to be created.
        @param  end_pose      PoseStamped object containing the end of the path to be created.
        @return path          Path object containing the sequence of waypoints of the created path.
        """
        path = Path()
        rospy.loginfo('A* planner.\n> start:{},\n> end:{}'.format(start_pose.pose.position,end_pose.pose.position))
        # TODO: IMPLEMENTATION OF THE ASTAR ALGORITHM

        mp = self.graph_from_map('map')

        # Setting the start node and end node in the graph using the start and end poses (125 + 10, 90 - 10), 26, 26/ 0.1*200/480
        mp.map_graph.root = "{}, {}".format(int(102 + 10*start_pose.pose.position.x), int(93 - 10*start_pose.pose.position.y))
        mp.map_graph.end = "{}, {}".format(int(102 + 10*end_pose.pose.position.x), int(93 - 10*end_pose.pose.position.y)) # 80, 113
        print(mp.map_graph.root,mp.map_graph.end)
        # Initializing the navigation path and solving the path planning problem
        environment = AStar(mp.map_graph)
        environment.solve(mp.map_graph.g[mp.map_graph.root], mp.map_graph.g[mp.map_graph.end])
        opt_path, opt_dist = environment.reconstruct_path(mp.map_graph.g[mp.map_graph.root], mp.map_graph.g[mp.map_graph.end])

        # Printing out the optimal path for clarity
        rospy.loginfo('\nPath:\n')
        rospy.loginfo(opt_path)

        # Converting the optimal path to waypoints in Cartesian form
        wp = PoseStamped()
        for pt in opt_path:
            # Points are in string form which need to be split and converting to numeric form
            coordinates = pt.split(',')
            coordinates = list(map(int,coordinates))
            wp.pose.position.x = (coordinates[0] - 102)/10
            wp.pose.position.y = (94 - coordinates[1])/10
            path.poses.append(wp)

        return path
    
    def get_path_idx(self,path,vehicle_pose):
        """! Path follower.
        @param  path                  Path object containing the sequence of waypoints of the created path.
        @param  current_goal_pose     PoseStamped object containing the current vehicle position.
        @return idx                   Position int the path pointing to the next goal pose to follow.
        """
        idx = 0
        # TODO: IMPLEMENT A MECHANISM TO DECIDE WHICH POINT IN THE PATH TO FOLLOW idx<=len(path)
        coordinates = vehicle_pose.pose.position.x, vehicle_pose.position.y
        min_dist = math.inf

        path_length = len(path.poses)
        for i in range(path_length):
            # Finding the Euclidean distance between the X and Y coordinates defined by difference of X,Y poses and the respective coordinates
            x = path.poses[i].pose.position.x - coordinates[0]
            y = path.poses[i].pose.position.y - coordinates[1]
            euclidean_dist = math.sqrt(x**2 + y**2)

            if euclidean_dist < min_dist:
                min_dist = euclidean_dist
                idx = i

            if idx + 1 >= path_length:
                return (path_length - 1)
            else:
                return (idx + 1)


    def path_follower(self,vehicle_pose, current_goal_pose):
        """! Path follower.
        @param  vehicle_pose           PoseStamped object containing the current vehicle pose.
        @param  current_goal_pose      PoseStamped object containing the current target from the created path. This is different from the global target.
        @return path                   Path object containing the sequence of waypoints of the created path.
        """
        speed = 0
        heading = 0
        # TODO: IMPLEMENT PATH FOLLOWER

        # Setting the X,Y coordinates for goal and instantaneous positions 
        x_goal, y_goal = current_goal_pose.pose.position.x, current_goal_pose.pose.position.y
        x_inst, y_inst = vehicle_pose.pose.position.x, vehicle_pose.pose.position.y

        current_heading = 2*math.atan2(vehicle_pose.pose.position.orientation.z, vehicle_pose.pose.position.orientation.w)
        heading = math.atan2(y_goal - y_inst, x_goal - x_inst) - current_heading
        speed = math.sqrt((x_goal - x_inst)**2 + (y_goal - y_inst)**2)

        # Defining the current and heading errors
        return speed,heading

    def move_ttbot(self,speed,heading):
        """! Function to move turtlebot passing directly a heading angle and the speed.
        @param  speed     Desired yaw angle.
        @param  heading   Desired speed.
        @return path      object containing the sequence of waypoints of the created path.
        """
        cmd_vel = Twist()
        # TODO: IMPLEMENT YOUR CONTROLLER LOW LEVEL CONTROLLER

        cmd_vel.linear.x = speed*0.1
        cmd_vel.angular.z = heading*0.1

        self.cmd_vel_pub.publish(cmd_vel)


    def run(self):
        """! Main loop of the node. You need to wait until a new pose is published, create a path and then
        drive the vehicle towards the final pose.
        @param none
        @return none
        """
        
        '''
            Main loop
        '''
        path_complete = False
        timeout = False
        idx = 0
        while not rospy.is_shutdown():
            # 1. Create the path to follow
            path = self.a_star_path_planner(self.ttbot_pose,self.goal_pose)
            # 2. Loop through the path and move the robot
            idx = self.get_path_idx(path,self.ttbot_pose)
            current_goal = path.poses[idx]
            speed,heading = self.path_follower(self.ttbot_pose,current_goal)
            self.move_ttbot(speed,heading)
            # ----------------------------------------
            # TODO: YOU NEED TO ADD YOUR SOLUTION HERE
            # ----------------------------------------
            self.rate.sleep() 
        rospy.signal_shutdown("[{}] Finished Cleanly".format(self.name))


if __name__ == "__main__":
    nav = Navigation(node_name='Navigation')
    nav.init_app()
    try:
        nav.run()
    except rospy.ROSInterruptException:
        print("program interrupted before completion", file=sys.stderr)

