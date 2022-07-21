#!/bin/bash

_PATH_PREFIX=`dirname $0`
_IMG_NAME="ros/orb-slam2"

docker build -t ${_IMG_NAME} -f ${_PATH_PREFIX}/Dockerfile ${_PATH_PREFIX}/..