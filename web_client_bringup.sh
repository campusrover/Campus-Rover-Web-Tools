#!/bin/bash

# Start the ros_core:
# --tab -e '/bin/bash -c "roscore"'

# Wait ~10 seconds for roscore to initialize...

# Bring up TurtleBot2 with video feed:
# --tab -e '/bin/bash -c "sleep 10; roslaunch turtlebot_bringup concert_client.launch"'

# OR bring up TurtleBot2 WITHOUT video feed:
# roslaunch turtlebot_bringup minimal.launch

# Start the map server:
# --tab -e '/bin/bash -c "sleep 10; rosrun map_server map_server /home/turtlebot/testmap.yaml"'

# Start amcl for SLAM navigation:
 #<--- Update yaml file name
# --tab -e '/bin/bash -c "sleep 10; export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch"'

# Enable websocket connections between clients & TurtleBot2
# --tab -e '/bin/bash -c "sleep 10; roslaunch rosbridge_server rosbridge_websocket.launch"'

# Spin up the locally hosted React web app:
# --tab -e '/bin/bash -c "npm start --prefix /home/turtlebot/turtlebot_ws/src/Campus-Rover-Web-Tools"'

gnome-terminal --tab -e '/bin/bash -c "roscore"' --tab -e '/bin/bash -c "sleep 10; roslaunch turtlebot_bringup concert_client.launch"' --tab -e '/bin/bash -c "sleep 10; rosrun map_server map_server /home/turtlebot/testmap.yaml"' --tab -e '/bin/bash -c "sleep 10; export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch"' --tab -e '/bin/bash -c "sleep 10; roslaunch rosbridge_server rosbridge_websocket.launch"' --tab -e '/bin/bash -c "npm start --prefix /home/turtlebot/turtlebot_ws/src/Campus-Rover-Web-Tools"'
