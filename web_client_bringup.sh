#!/bin/bash

PREFIX="--tab -e '/bin/bash -c "

# Start the roscore
CMD="gnome-terminal ${PREFIX} \"roscore\"'"

CMD_ARR=(
# Bring up the robot with video feed
"roslaunch turtlebot_bringup concert_client.launch"
# Start the map server
"rosrun map_server map_server /home/turtlebot/testmap.yaml"
# Start AMCL
"export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch"
# Enable websocket connections
"roslaunch rosbridge_server rosbridge_websocket.launch"
# Start the waypoint server to list potential TB2 destinations
"rosrun campus_rover_gen2 waypoint_server.py"
# Start the web server
"npm start --prefix ~/turtlebot_ws/src/Campus-Rover-Web-Tools/Web\ Client"
)

for curr_cmd in "${CMD_ARR[@]}"
do
    :
    CMD="${CMD} ${PREFIX} \"sleep 10; $curr_cmd\"'"
done

eval $CMD
