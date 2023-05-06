#!/usr/bin/env python3

import rospy
import math
from fiducial_msgs.msg import FiducialTransformArray
from geometry_msgs.msg import Transform

from aut_sys.msg import distance, motors, leds, lines, servos


class ClassName: 
    def __init__(self):
        self.dist = 0
        self.data = 0
        self.marker = 0

        # Define the execution rate object (10Hz)
        self.rate = rospy.Rate(10)
        self.pub = rospy.Publisher('/motors', motors, queue_size=10)

        # Creating the motors object
        self.mo = motors()

        # Define a subscriber that will catch the messages published by Fiducial Transforms
        rospy.Subscriber("/fiducial_transforms", FiducialTransformArray, self.UCTRONICS_callback)
        self.msg_bool = False
        self.finish_bool = False

        while not rospy.is_shutdown():
            self.rate.sleep()

    def UCTRONICS_callback(self,msg):
        a = 0
        b = 0
        # Checking if any fiducials are available
        # If the length of this array is zero, that means no fiducials are being read from the subscriber
        if (len(msg.transforms) == 0):
            rospy.loginfo('No fiducials')
        else:
            # Storing fiducial id, x, and z distances
            fid = msg.transforms[0].fiducial_id
            x = msg.transforms[0].transform.translation.x
            z = msg.transforms[0].transform.translation.z

            # Printing above values for info
            rospy.loginfo("Fiducial ID: {}".format(fid))
            rospy.loginfo("Linear Distance: {}".format(z))
            rospy.loginfo("Lateral Distance: {}".format(x))
            

            # Checking if the given eulerian distance is satisfied then moving forward if it is more
            if (abs(x) <= 0.01) and (z > math.sqrt((1.5)**2 + (1)**2):
                a = 0.3
                b = 0.3
                rospy.loginfo("Moving forward")

            # Turning right if lateral distance is less than or equal to error
            elif x <= 0.01: 
                rospy.loginfo('Turning right')
                a = 0.3
                b = -0.3

            # Turning left if lateral distance is more than error
            elif x > 0.01:
                rospy.loginfo('Turning left')
                a = -0.3
                b = 0.3

            elif z <= 1.8:
                # Setting motor velocities to zero if eulerian distance is less than 1.8
                rospy.loginfo('Stopping')
                a = 0
                b = 0

        # Setting the motor speeds and then publishing
        self.mo.leftSpeed = b
        self.mo.rightSpeed = a 
        self.pub.publish(self.mo)

    def main(self):
        while not rospy.is_shutdown():
            self.rate.sleep()

if __name__ == '__main__':
    # Declare the node, and register it with a unique name
    rospy.init_node('controller_node', anonymous=True)
    c1 = ClassName()
    rospy.spin()
