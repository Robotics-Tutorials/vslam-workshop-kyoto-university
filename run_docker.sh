#!/bin/bash

echo "Display: ${DISPLAY}"

echo "Allow all local X11 connections"

xhost +local:docker

docker run --rm -it --privileged --name ros-orb-slam2 --net=host \
	-e QT_X11_NO_MITSHM=1 -e DISPLAY=$DISPLAY \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume="${PWD}/scripts:/home/scripts:rw" \
    --group-add video \
	ros/orb-slam2
