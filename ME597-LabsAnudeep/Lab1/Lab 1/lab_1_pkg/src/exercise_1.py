#!/usr/bin/env python3

import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan


"""
This class contains the Node, Publisher, and Subscriber functions

"""
class Nodes:

    # Creating the class constructor
    def __init__(self, dist, rate):

        #public class variables 
        self.dist = dist
        self.rate = rate

    def callback(self,data):
        self.dist = data.ranges[0]
        rospy.loginfo('Received ctr:{}'.format(self.dist))

    # Creating the node function
    def exercise_node(self):

        # Creating a publisher object
        pub = rospy.Publisher('cmd_vel', Twist, queue_size = 1)

        # Declaring node and register it
        rospy.init_node('Exercise_Node', anonymous=True)

        # Creating a subscriber
        rospy.Subscriber("/scan", LaserScan, self.callback)

        # Setting execution rate
        rate = rospy.Rate(10)


        """
            This is the main node loop
    
        """
        while not rospy.is_shutdown():
    
            # Creating the message object
            vel_msg = Twist()
    
            # Populating the custom message object
            vel_msg.linear.x = 0.5 * (self.dist - 1)
            vel_msg.angular.z = 0
    
            # Logging info on console
            rospy.loginfo('[exercise_node] Running')
            # Publishing data
            pub.publish(vel_msg)
    
            # Sleep the necessary amount of time to keep a 10Hz execution rate
            rate.sleep()


if __name__ == '__main__':

    dist = 0
    rate = 0
    exercise1 = Nodes(dist, rate)

    try:
        exercise1.exercise_node()
    except rospy.ROSInterruptException:
        pass
