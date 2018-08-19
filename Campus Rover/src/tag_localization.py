#!/usr/bin/env python
import rospy
import tf
from tf import TransformerROS, Transformer 
from geometry_msgs.msg import PoseStamped, Point, PoseWithCovarianceStamped
from apriltags2_ros.msg import AprilTagDetectionArray
from std_msgs.msg import Header
import numpy as np

rospy.init_node('tag_localization')

transformer = TransformerROS()
listener = tf.TransformListener()

def tag_detection_callback(msg):
    print msg
    if msg.detections:
        robot_to_tag_pose = PoseStamped(msg.detections[0].pose.header, msg.detections[0].pose.pose.pose)
        print robot_to_tag_pose
        pos = robot_to_tag_pose.pose.position
        orientation = robot_to_tag_pose.pose.orientation
        robot_x = -7.38 + pos.x
        robot_y = -0.20 + pos.y
		
        angle = np.arctan(robot_x / robot_y)
        robot_angle = 90 - angle
        
        robot_pose = PoseWithCovarianceStamped()
        robot_pose.header = Header()
        robot_pose.header.stamp = rospy.Time.now()
        robot_pose.header.frame_id = 'map'

        robot_pose.pose.pose.position = Point(robot_x, robot_y, pos.z)
        
        robot_pose.pose.pose.orientation.w = 1.0
	print "====="
	#print robot_pose
	robot_localization_pub.publish(robot_pose)

        


tag_detection_sub = rospy.Subscriber('/tag_detections', AprilTagDetectionArray, tag_detection_callback)
robot_localization_pub = rospy.Publisher('/initialpose', PoseWithCovarianceStamped)
br = tf.TransformBroadcaster()
rate = rospy.Rate(5)

#tag 13; x=-1.47 y=1.61 z=0.52 Quaternion: -0.44 0.54 0.56 -0.43
#tag 14; x=-7.38 y=-0.20 z=0.58 Quaternion: 0.51 0.48 0.47 0.52
#tag 12; x=-5.20 y=-6.12 z=0.39 Quaternion: 0.04 0.71 0.70 0.08
#tag 10; x=-2.86 y=-3.53 z=0.51 Quaternion: -0.47 0.55 0.54 -0.43
#tag 7;   x=1.00 y=3.82 z=0.49 Quaternion: 0.70 -0.10 -0.09 0.67
#tag 11;  x=-1.55 y=1.88 z=0.37 Quaternion: 0.56 0.43 0.46 0.52
#tag 8: x=-2.91 y=-3.12 z=0.49 Q 0.53 0.47 0.46 0.52

while not rospy.is_shutdown():
	br.sendTransform(
		(-7.38, -0.20, -0.58),
		(0.51, 0.48, 0.47, 0.52),
		rospy.Time.now(),
		'tag_14',
		'map'
	)
	rate.sleep()
