#!/bin/bash

echo "Display: ${DISPLAY}"

echo "Allow all local X11 connections"

xhost +local:docker

echo "Running ORB_SLAM2 ROS kinetic Docker image ..."

docker run -it --privileged --name ros-kinetic-orb-slam2 --net=host \
	-e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
        --group-add video \
        --device=/dev/dri:/dev/dri \
	ros/orb-slam2
