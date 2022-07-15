# Visual SLAM Workshop at Kyoto University 2022

## Getting Started

Clone this repo:
```shell
git clone https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university.git
```

### Install Docker [Update]

```shell
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(cut -f2 <<< $(lsb_release -c)) stable"
sudo apt update
```

```shell
sudo apt install docker-ce -y
```
Check the installation:
```shell
sudo systemctl status docker
```

Setting up permisssions:
```shell
sudo usermod -aG docker ${USER}
su - ${USER}
```

Run Docker's hello world:
```shell
docker run hello-world
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
