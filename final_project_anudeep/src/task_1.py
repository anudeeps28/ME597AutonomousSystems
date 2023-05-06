#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist


# dist = 100

class ClassName():
    """docstring for ClassName"""
    def __init__(self):
        self.dist = 0

        rospy.init_node('ex1_node', anonymous=True)

        self.vel_msg = Twist()
        self.pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)

        # Define the execution rate object (10Hz)
        rate = rospy.Rate(10)

        # Define a subscriber that will catch the messages published by scan
        rospy.Subscriber("/scan", LaserScan, self.scan_callback)

        # This node doesn't have to run all the time, but whenever a message is received, therefore, we can leave it spinning (waiting to wake up whenever a message is available).
        rospy.spin()
        

    def scan_callback(self, data):
        # data will contain the message information of type LaserScan, we can access and print that data as follows.
        self.dist = data.ranges[0] 
        self.left = data.ranges[45]
        self.right = data.ranges[315]

        if self.dist > 2:
            self.vel_msg.linear.x = 0.8
            self.vel_msg.angular.z = 0.0
            print("moving forward")

        elif self.dist < 2:
        #     # -0.3
            self.vel_msg.linear.x = 0.0
            self.vel_msg.angular.z = 0.0
            print("stopping")


            m = False
            while m == False:
                self.vel_msg.linear.x = 0.0
                self.vel_msg.angular.z = 0.3
                self.pub.publish(self.vel_msg)
                print("moving back and rotating")
                m = True

        self.pub.publish(self.vel_msg)
  


if __name__ == '__main__':
    try:
        c1 = ClassName()
    except rospy.ROSInterruptException:
        pass


