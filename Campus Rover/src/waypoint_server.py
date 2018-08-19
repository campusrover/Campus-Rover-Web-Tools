#!/usr/bin/env python
import rospy
from move_base_msgs.msg import *
from yocs_msgs.msg import Waypoint, WaypointList
from geometry_msgs.msg import Pose, Point, Quaternion
from campus_rover.srv import WaypointsResponse, Waypoints
import json
import os 

rospy.init_node('waypoint_server')

def waypoint_list(arg):
	dir_path = os.path.dirname(os.path.realpath('waypoints.json'))
	data = json.load(open('/home/turtlebot/turtlebot_ws/src/campus_rover/src/waypoints.json'))
	waypoints = []
	for waypoint in data:
	
		name = waypoint['name']
		location = waypoint['location']
		
		pos = Point(location['x'], location['y'], location['z'])
		orientation = Quaternion(0, 0, 0, 1)
		pose = Pose(pos, orientation)
		
		header = std_msgs.msg.Header()
		header.stamp = rospy.Time.now()
		
		waypoint = Waypoint(header, name, pose)
		waypoints.append(waypoint)
		
	waypoints = WaypointList(waypoints)	
	print waypoints
	response = WaypointsResponse(waypoints)

	return response

service = rospy.Service('waypoints', Waypoints, waypoint_list)
rospy.spin()



