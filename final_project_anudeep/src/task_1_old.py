#!/usr/bin/env python3

# from shutil import move
# import rospy
# from sensor_msgs.msg import LaserScan
# from geometry_msgs.msg import Twist



# def callback(msg):
#     if msg.ranges[0] > 1:
#         move.linear.x = 0.5
#         move.angular.z = 0.0
#         pub.Publish(move)
#         rate = rospy.Rate(10)


#     if msg.ranges[0] < 1:
#         move.linear.x = 0
#         move.angular.z = 0

#         m = False
#         while m == False:
#             move.linear.x = -0.2
#             move.angular.z = 0.5
#             m == True
        

#         pub.Publish(move)
#         rate = rospy.Rate(10)

# rospy.init_node('task1', anonymous = True)
# sub = rospy.Subscriber('/scan', LaserScan, callback) 
# pub = rospy.Publisher('/cmd_vel', Twist, queue_size = 1)
# move = Twist()

# rospy.spin()

'''This is the old code'''

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist


# dist = 100

class ClassName():
    """docstring for ClassName"""
    def __init__(self):
        self.dist = 0
        self.vel_msg = Twist()
        

    def scan_callback(self, data):
        # data will contain the message information of type LaserScan, we can access and print that data as follows.
        self.dist = data.ranges[0] 

        if self.dist > 1:
                self.vel_msg.linear.x = 0.5 
                self.vel_msg.angular.z = 0.0
                #rate.sleep()

        elif self.dist < 1:
            self.vel_msg.linear.x = -0.3
            self.vel_msg.angular.z = 0.0


            m = False
            while m == False:
                self.vel_msg.linear.x = -0.5
                self.vel_msg.angular.z = 0.2
                pub.publish(self.vel_msg)
                m = True

        pub.publish(self.vel_msg)


 # def scan_callback(data):
 #    # data will contain the message information of type LaserScan, we can access and print that data as follows.
 #   dist = (data.ranges[0])
 #   # dist = 100
 #   print(dist)
   

    def ex1_node(self):
# Declare the node, and register it with a unique name
        rospy.init_node('ex1_node', anonymous=True)
        
        # Define the execution rate object (10Hz)
        rate = rospy.Rate(10)

        # Create a publisher object with Twist(gazebo)
        pub = rospy.Publisher('cmd_vel', Twist, queue_size=1)
    

        # Define a subscriber that will catch the messages published by scan
        rospy.Subscriber("/scan", LaserScan, self.scan_callback)

        # This node doesn't have to run all the time, but whenever a message is received, therefore, we can leave it spinning (waiting to wake up whenever a message is available).
        rospy.spin()

        '''
            This is the main loop
        '''
        
        #while not rospy.is_shutdown():
            # Create message object with a specific type
            # rospy.Subscriber("/scan", LaserScan, scan_callback)

            
            
            # Populate custom message object

             
            #rate.sleep()
            # vel_msg.linear.x = 0.5 * (dist-1)
            # vel_msg.linear.y = 0.1
           
            # vel_msg.angular.z = 1
            # Log/trace information on console
            # rospy.loginfo('[my_control_node] Running')
            # Publish the data
            #pub.publish(vel_msg)
            # Sleep the necessary amount of time to keep a 10Hz execution rate
        #rate.sleep()


if __name__ == '__main__':
    try:
        c1 = ClassName()
        c1.ex1_node()
    except rospy.ROSInterruptException:
        pass


