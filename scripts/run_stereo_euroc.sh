#!/bin/bash

V1_BAG_FILE=/home/datasets/V1_01_easy.bag
MH_BAG_FILE=/home/datasets/MH_01_easy.bag

DS_FILE=${V1_BAG_FILE}

if [ -z $@ ]; then
    echo "Using V1 dataset by default"
else
    if [ "$1" = "MH" ]; then
        DS_FILE=${MH_BAG_FILE}
    else
        echo "Unknown dataset: using default"
    fi
fi

export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/ORB_SLAM2/Examples/ROS
roslaunch `dirname $0`/launch/stereo.launch bag_file:=${DS_FILE}
