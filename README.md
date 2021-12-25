# CV 2021 Visual SLAM Workshop

## Getting Started

Clone this repo:
```shell
git clone https://github.com/ramsafin/cv2021-vslam-workshop.git
```

### Install Docker

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

Check X11 config:
```shell
sudo apt install xauth

xauth list
echo $DISPLAY
```

Load Docker image from `*.tar` file:
```shell
docker load -i <path to image tar file>
```
or build it from source:

```shell
cd ~/cv2021-vslam-workshop
docker build -t ros/orb-slam2 -f Dockerfile .
```

## Visual SLAM

### Basler (previous workshop)
[_Optional_] edit camera config: `~/basler_lab_ws/src/pylon-ros-camera/pylon_camera/config/default.yaml`

Start streaming images from camera:
```shell
cd ~/basler_lab_ws
source devel/setup.bash
roslaunch pylon_camera pylon_camera_node.launch
```

### ORB_SLAM2

Run the Docker container with ORB_SLAM2:
```shell
cd ~/cv2021-vslam-workshop
./run_docker
```

Launch ORB_SLAM2 (inside the Docker container):
```shell
cd ORB_SLAM2
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${PWD}/Examples/ROS

rosrun ORB_SLAM2 Mono Vocabulary/ORBvoc.txt Examples/Monocular/Basler.yaml \
       camera/image_raw:=/pylon_camera_node/image_raw
```
