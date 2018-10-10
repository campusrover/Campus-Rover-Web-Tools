Instructions for enabling CR Live Map:

On the TurtleBot2:

    Terminal A: 
    This brings up the turtlebot.
        1) export MASTER_URI=__________
        2) run turtlebot's bringup


    Terminal B: 
    These steps start the map server, which CR Live Map will
    use to render an image of the map being used.
        1) export MASTER_URI=___________
        2) run the map_server

    Terminal C:
    These steps allow a websocket connection between the robot
    and the device on which CR Live Map will be viewed/run.
        1) export MASTER_URI=_______
        2) export TURTLEBOT_MAP_FILE=_______
        3) run the rosbridge command

    Terminal D:
    These initialize the amcl that the robot will use for SLAM navigation
        1) export MASTER_URI=_______
        2) export TURTLEBOT_MAP_FILE
        3) run amcl_demo

On Other Machine:
    Launch RViz to begin giving goal poses:
        1) `roslaunch turtlebot_rviz_launchers view_navigation.launch --screen`


Notes on LiveMap Dependencies

    1) roslibjs
        - Script URL: https://static.robotwebtools.org/roslibjs/current/roslib.js
        - Wiki: http://wiki.ros.org/roslibjs
        - roslibjs is a javascript library that allows web interfacing with ROS.
        - Includes methods to publish, subscribe, etc.
        - Uses rosbridge to establish a websocket connection with a robot.

    2) ros2djs
        - Script URL: https://static.robotwebtools.org/ros2djs/current/ros2d.js
        - Wiki: http://wiki.ros.org/ros2djs
        - ros2djs is a javascript library built ontop of roslibjs to support 2D visualizations.
        - Specifically, ros2djs uses an occupancy grid to generate a 2D map visualization,
          including an arrow image representing the robot's location on the map.