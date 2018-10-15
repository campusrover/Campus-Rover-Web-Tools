#!/bin/bash

# Start the ros_core:
# echo "1) Starting ros_core..." && gnome-terminal -e roscore

# Bring up TurtleBot2 with video feed:
# echo "2) Bringing up TurtleBot2..." && gnome-terminal -e roslaunch turtlebot_bringup concert_client.launch
# OR bring up TurtleBot2 WITHOUT video feed:
# roslaunch turtlebot_bringup minimal.launch

# Start the map server:
# echo "3) Starting map_server..." && gnome-terminal -e rosrun map_server map_server /home/turtlebot/testmap.yaml #<--- Update yaml file name

# Start amcl for SLAM navigation:
 #<--- Update yaml file name
# echo "4) Starting amcl..." && gnome-terminal -x bash -c "export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch"

# Enable websocket connections between clients & TurtleBot2
# echo "5) Making websocket connections available..." && gnome-terminal -e roslaunch rosbridge_server rosbridge_websocket.launch


gnome-terminal --tab -e '/bin/bash -c "roscore"' --tab -e '/bin/bash -c "sleep 10; roslaunch turtlebot_bringup concert_client.launch"' --tab -e '/bin/bash -c "sleep 10; rosrun map_server map_server /home/turtlebot/testmap.yaml"' --tab -e '/bin/bash -c "sleep 10; export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch"' --tab -e '/bin/bash -c "sleep 10; roslaunch rosbridge_server rosbridge_websocket.launch"'
