#!/bin/bash

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/ORB_SLAM2/Examples/ROS
roslaunch `dirname $0`/launch/stereo.launch
