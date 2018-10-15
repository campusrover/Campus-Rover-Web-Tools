<h1>Setting up TB2’s machine to host web app:</h1>

<h2>Initial Setup:</h2>

1. cd into the web app’s directory:
	`cd /home/turtlebot/turtlebot_ws/src/Campus-Rover-Web-Tools`


1. Install nvm: 

	`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash`


1. Use nvm to install Node: 

	`nvm install --lts`


1. Adjust file permissions: 

	`sudo chgrp -R $USER node_modules/`


1. Install node package manager (npm). This _will_ take a while.

	`npm install`

<h2>To bring-up TB2 and start the web app:</h2>
	
All steps can be taken care of with a single script, included at the root of the repo: `web_client_bringup.sh`

Here’s a breakdown of each command in the script. If the script fails, running these commands manually, each in their own tab, should have the same effect as running the script.


1. Start the ROS core.

	`roscore`
	
	Note that every subsequent command waits 10 seconds (`sleep 10`) for the roscore to initialize.

1. Bring up TB2 with video feed:

	`roslaunch turtlebot_bringup concert_client.launch`

	- OR bring up TurtleBot2 WITHOUT video feed: 

	`roslaunch turtlebot_bringup minimal.launch`


1. Start the map server:

	`rosrun map_server map_server /home/turtlebot/testmap.yaml`


1. Start amcl for SLAM navigation:

	`export TURTLEBOT_MAP_FILE=/home/turtlebot/testmap.yaml; roslaunch turtlebot_navigation amcl_demo.launch`


1. Enable websocket connections between clients & TurtleBot2

	`roslaunch rosbridge_server rosbridge_websocket.launch`
	
1. Launch  the waypoint server, to serve possible destinations for TurtleBot2


	`rosrun campus_rover_gen2 waypoint_server.py`


1. Spin up the locally hosted React web app:

	`npm start --prefix /home/turtlebot/turtlebot_ws/src/Campus-Rover-Web-Tools`
