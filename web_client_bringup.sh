#!/bin/bash

# Start the ros_core:
echo 1) Starting ros_core... && roscore &

# Bring up TurtleBot2 with video feed:
echo 2) Bringing up TurtleBot2... && roslaunch turtlebot_bringup concert_client.launch &
# OR bring up TurtleBot2 WITHOUT video feed:
# roslaunch turtlebot_bringup minimal.launch

# Start the map server:
echo 3) Starting map_server... && rosrun map_server map_server /home/turtlebot/testmap.yaml & #<--- Update yaml file name

# Start amcl for SLAM navigation:
export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml & #<--- Update yaml file name
echo 4) Starting amcl... && roslaunch turtlebot_navigation amcl_demo.launch &

# Enable websocket connections between clients & TurtleBot2
echo 5) Making websocket connections available... && roslaunch rosbridge_server rosbridge_websocket.launch &