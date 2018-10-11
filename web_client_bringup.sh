#!/bin/bash

# Start the ros_core:
echo 1) Starting ros_core... && roscore &

# Bring up TurtleBot2 with video feed:
echo 2) Bringing up TurtleBot2... && roslaunch turtlebot_bringup concert_client.launch &
# OR bring up TurtleBot2 WITHOUT video feed:
# roslaunch turtlebot_bringup minimal.launch

# Start the map server:
echo 3) Starting map_server... && rosrun map_server map_server /home/turtlebot/testmap.yaml & #<--- Update yaml file name

# Start the waypoint server:
echo 4) Starting waypoint server... && rosrun campus_rover_gen2 waypoint_server.py &

# Start the robot vitals server:
echo 5) Starting robot vitals server... && rosrun campus_rover robot_vitals.py &

# Start amcl for SLAM navigation:
export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml & #<--- Update yaml file name
echo 6) Starting amcl... && roslaunch turtlebot_navigation amcl_demo.launch &

# Enable websocket connections between clients & TurtleBot2
echo 7) Making websocket connections available... && roslaunch rosbridge_server rosbridge_websocket.launch &