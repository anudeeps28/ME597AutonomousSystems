#!/usr/bin/env python3

import sys
import math
import rospy
from nav_msgs.msg import Path, Odometry
from geometry_msgs.msg import PoseStamped, Twist

from Controller import PidController
from astar_map import a_star_planning

# this is the best navigation class ever!
class Navigation:

    def __init__(self, node_name='Navigation'):
        self.node_name = node_name
        self.rate = 0

        # setting variables of positions 
        self.goal_pose = PoseStamped()
        self.ttbot_pose = PoseStamped()

        # setting motion variables
        self.current_heading = 0
        self.goal_heading = 0
        self.path = []
        self.callibration_status = False

     # initializing nodes/making subscriber and publisher     
    def init_app(self):
        rospy.init_node(self.node_name, anonymous=True)
        self.rate = rospy.Rate(100)
        rospy.Subscriber('/move_base_simple/goal', PoseStamped, self.__goal_pose_cbk, queue_size=10)
        rospy.Subscriber('/odom', Odometry, self.__ttbot_pose_cbk, queue_size=10)
        self.path_pub = rospy.Publisher('global_plan', Path, queue_size=10)
        self.cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)


    def __goal_pose_cbk(self, data):

        self.goal_pose = data
        q0 = self.goal_pose.pose.orientation.x
        q1 = self.goal_pose.pose.orientation.y
        q2 = self.goal_pose.pose.orientation.z
        q3 = self.goal_pose.pose.orientation.w

        n = 2.0*(q3*q2+q0*q1)
        d = 1.0 - 2.0*(q1*q1+q2*q2)

        self.goal_heading = math.degrees( math.atan2(n,d) ) # calculation yaw (degrees)
        print("Goal pose received (heading) = ", self.goal_heading)
        if self.callibration_status:
            self.a_star_path_planner() # A* solution
            self.path_follower()
            print("Goal reached")

    # turtlebot pose estimate check
    def __ttbot_pose_cbk(self, data):
        self.ttbot_pose = data.pose
        cov = data.pose.covariance
        q0 = self.ttbot_pose.pose.orientation.x
        q1 = self.ttbot_pose.pose.orientation.y
        q2 = self.ttbot_pose.pose.orientation.z
        q3 = self.ttbot_pose.pose.orientation.w
        n = 2.0*(q3*q2+q0*q1)
        d = 1.0 - 2.0*(q1*q1+q2*q2)
        self.current_heading = math.degrees( math.atan2(n,d) )  # yaw

    # Just after starting, the robot calibrates by rotating around the map
    def callibrate(self):
        cmd_vel = Twist()
        if (not(self.current_heading>-70 and self.current_heading<-5)): 
            cmd_vel.angular.z = 0.25 # rotating around on its place
            self.cmd_vel_pub.publish(cmd_vel)
            return 1 # still callibrating
        else:
            cmd_vel.angular.z = 0
            self.cmd_vel_pub.publish(cmd_vel)
            return 0 # calibration done; yaw set to 0.
        

    # aligning turtlebot to the target pose
    def align_ttbot(self, target=0):
        cmd_vel = Twist()
        cmd_vel.linear.x = 0.0 # setting linear velocity 0
        dt = 1/100
        error = (target-self.current_heading)
        print("Please wait, Aligning to : ", target)

        while abs(error)>0.5: # PID control algorithm
            error = (target-self.current_heading)
            PID_obj_1 = PidController(0.0009, 0.0008, 0.0001, dt, -2, 2)
            cmd_vel.angular.z = PID_obj_1.step(error)
            self.cmd_vel_pub.publish(cmd_vel)

        cmd_vel.angular.z = 0
        print("Done aligning")
        self.cmd_vel_pub.publish(cmd_vel)

    # moving turtlebot towards the target pose
    def move_ttbot(self, target_y=0, target_x=0): # starting goal pose = 0,0
        cmd_vel = Twist()
        cmd_vel.angular.z = 0 # making angular velocity 0 to move forware
        dt = 1/100
        d = ( (target_y-self.ttbot_pose.pose.position.y)**2 + (target_x-self.ttbot_pose.pose.position.x)**2)
        error = abs(d)
        print("Moving to : ", target_y, target_x)

        while error>0.09:
            d = ( (target_y-self.ttbot_pose.pose.position.y)**2 + (target_x-self.ttbot_pose.pose.position.x)**2)
            error = abs(d)
            PID_controller_obj = PidController(0.01, 0.009, 0.008, dt, 0.0, 0.4)
            cmd_vel.linear.x = PID_controller_obj.step(error)
            self.cmd_vel_pub.publish(cmd_vel)

        cmd_vel.linear.x = 0 #resetting to 0
        self.cmd_vel_pub.publish(cmd_vel)

    # goal planner
    def a_star_path_planner(self):
        y_rviz_goal, x_rviz_goal = self.goal_pose.pose.position.y, self.goal_pose.pose.position.x
        y_rviz_current, x_rviz_current = self.ttbot_pose.pose.position.y, self.ttbot_pose.pose.position.x

        res = 0.10*4

        # calculating map in map frame
        y_pgm = int(120 - (1/res)*(26+y_rviz_current))
        x_pgm = int(-0 + (1/res)*(26+x_rviz_current))
        start_pt = str(y_pgm) + ',' + str(x_pgm)

        y_pgm = int(120 - (1/res)*(26+y_rviz_goal))
        x_pgm = int(-0 + (1/res)*(26+x_rviz_goal))
        end_pt = str(y_pgm) + ',' + str(x_pgm)

        # feeding the above to path planning algorithm
        self.path = a_star_planning(start_pt, end_pt) 


    def path_follower(self):
        for index in range(len(self.path)):
            y, x = self.path[index]
            res = 0.10*4

            #calculating the x,y in rviz (scaling according to resulation)
            # origin is at 26,26
            y_rviz = -26.0 + res*(120-y)
            x_rviz = -26.0 + res*(0+x)

            # caluclating the heading angle
            heading = math.degrees(math.atan2( (y_rviz-self.ttbot_pose.pose.position.y), (x_rviz-self.ttbot_pose.pose.position.x) ))
            
            # aligning the robot in that heading angle
            self.align_ttbot(heading)
            self.move_ttbot(y_rviz, x_rviz)
        heading = self.goal_heading
        self.align_ttbot(heading)    


    def run(self):
        while not rospy.is_shutdown():
            self.rate.sleep() 
        rospy.signal_shutdown("[{}] Finished".format(self.name))


if __name__ == "__main__":

    print("Localization starting")

    nav = Navigation(node_name='task_2')
    nav.init_app()

    print("Callibrating, please wait...")
    while (nav.callibrate()):
        pass
    nav.align_ttbot(0)
    nav.callibration_status = True
    print("Localization done")

    print("Callibration done; give a 2D goal pose")

    try:
        nav.run()
    except rospy.ROSInterruptException:
        print("Not completed", file=sys.stderr)