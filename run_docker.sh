#!/bin/bash

echo "Display: ${DISPLAY}"

echo "Allow all local X11 connections"

xhost +local:docker

docker run --rm -it --privileged --net=host \
	--name ros-orb-slam2 \
	-e QT_X11_NO_MITSHM=1 \
	-e DISPLAY=$DISPLAY \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume="${PWD}/datasets:/home/datasets" \
    --group-add video \
	ros/orb-slam2
