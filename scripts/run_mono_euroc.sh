#!/bin/bash

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/ORB_SLAM2/Examples/ROS

rosrun ORB_SLAM2 Mono /home/ORB_SLAM2/Vocabulary/ORBvoc.txt /home/ORB_SLAM2/Examples/Stereo/EuRoC.yaml
