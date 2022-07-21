#!/bin/bash

export LIBGL_ALWAYS_INDIRECT=0

if [ -z $DISPLAY ]; then
	echo "DISPLAY is not set. Generating a new one ... (might not work correctly)"
	export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
fi

echo "Display: ${DISPLAY}"

echo "Allow all local X11 connections"
xhost +local:docker

_CONTAINER_NAME="ros-orb-slam2"
_PWD=`echo ${PWD} | sed 's/\/docker//'`

docker run --rm -it --privileged --net=host \
	--name ${_CONTAINER_NAME} \
	-e QT_X11_NO_MITSHM=1 -e DISPLAY=${DISPLAY} \
	--volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume="${_PWD}/datasets:/home/datasets" \
	--volume="${_PWD}/ros_workspace:/home/ros_workspace" \
  	--group-add video \
	ros/orb-slam2
