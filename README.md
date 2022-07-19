# Visual SLAM Workshop at Kyoto University 2022

## Getting Started

### Install Docker

Choose your OS and follow the instructions:

- Ubuntu: https://docs.docker.com/desktop/install/ubuntu
- Mac OS: https://docs.docker.com/desktop/install/mac-install
- Windows: https://docs.docker.com/desktop/install/windows-install

### Clone this repo

```shell
git clone https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university.git
```

### Prepare a Docker image

Load Docker image from `*.tar` file:
```shell
docker load -i <path to image tar file>
```
or build it from source:

```shell
cd ~/vslam-workshop-kyoto-university
docker build -t ros/orb-slam3 -f Dockerfile .
```

## SLAM

Run the Docker container with ORB_SLAM2:
```shell
cd ~/vslam-workshop-kyoto-university
./run_docker.sh
```

Launch ORB_SLAM2 (inside the Docker container):
```shell
cd ORB_SLAM2
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${PWD}/Examples/ROS

rosrun ORB_SLAM2 Mono Vocabulary/ORBvoc.txt Examples/Monocular/Basler.yaml \
       camera/image_raw:=/pylon_camera_node/image_raw
```
