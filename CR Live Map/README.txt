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