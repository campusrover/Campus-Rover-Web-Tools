#!/usr/bin/env python

import rospy
from diagnostic_msgs.msg import DiagnosticArray
from std_msgs.msg import Float32, Bool

rospy.init_node('robot_vitals')

laptop_battery = 0
robot_battery = 0
laptop_charging = False
robot_charging = False

def sensors_callback(msg):
	print "callback"
	laptop_battery_status = {}
	for status in msg.status:
		if status.name == "/Power System/Battery":
			for value in status.values:
				if value.key == 'Percent':
					robot_battery = float(value.value)
				elif value.key == "Charging State":
					if value.value == "Trickle Charging" or value.value == "Full Charging":
						charging = True
					else:
						charging = False
		elif status.name == "/Power System/Laptop Battery":
			for value in status.values:
				laptop_battery_status[value.key]=value.value

	if (laptop_battery_status):
		percentage = float(laptop_battery_status['Charge (Ah)'])/float(laptop_battery_status['Capacity (Ah)'])
		laptop_battery = percentage*100
		laptop_charging = True if float(laptop_battery_status['Current (A)']) > 0.0 else False

	laptop_battery_pub.publish(laptop_battery)
	robot_battery_pub.publish(robot_battery)
	robot_charging_pub.publish(robot_charging)
	laptop_charging_pub.publish(laptop_charging)

sensors_sub = rospy.Subscriber('/diagnostics_agg', DiagnosticArray, sensors_callback)
laptop_battery_pub = rospy.Publisher('/campus_rover/laptop_battery', Float32, queue_size=1)
robot_battery_pub = rospy.Publisher('/campus_rover/robot_battery', Float32, queue_size=1)
laptop_charging_pub = rospy.Publisher('/campus_rover/laptop_charging', Bool, queue_size=1)
robot_charging_pub = rospy.Publisher('/campus_rover/robot_charging', Bool, queue_size=1)

rospy.spin()

