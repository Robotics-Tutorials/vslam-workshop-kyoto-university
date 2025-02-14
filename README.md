# Visual SLAM Workshop at Kyoto University 2022

## Getting Started

There are 2 options: Docker or Virtual Box. Virtual Box is the less painfull option.

### Datasets

Datasets can be downloaded [here](https://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets).

In this workshop we will use [`Vicon Room 1 01`](http://robotics.ethz.ch/~asl-datasets/ijrr_euroc_mav_dataset/machine_hall/MH_01_easy/MH_01_easy.bag) and [`Machine Hall 01`](http://robotics.ethz.ch/~asl-datasets/ijrr_euroc_mav_dataset/vicon_room1/V1_01_easy/V1_01_easy.bag) ROS bag files.

**Note**: I will bring a USB flash drive with ROS bag files.

### 1. Virtual Box

Download and install Virtual Box ([link](https://www.virtualbox.org/wiki/Downloads)).

Use the prepared VM image (download it [here](https://drive.google.com/drive/folders/1CHj3sL1I33OKXsCB-aTuXJNJo4xopvsi?usp=sharing)).

Import the image by following "File" > "Import Appliance".

Username: `robot`<br>
Password: `hidetoshi`

Now you are ready to move to step 3 - Run ORB-SLAM2.

### 2. Docker

#### 2.1 ONLY FOR WINDOWS USERS - Install Windows Sybsystem for Linux (WSL)

Follow the official instructions [here](https://docs.microsoft.com/en-us/windows/wsl/install) to install WSL2 and Ubuntu 20.04 LTS.

**Note**: Windows users are encouraged to install [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=ja-jp&gl=JP). You can still use PowerShell, but it does not that convenient.

The result should look like this: Ubuntu 20.04 in Windows Terminal.

<p align="center">
  <img align="center" src="images/WSL2 Ubuntu 20.04 LTS.png" width="75%">
</p>

#### 2.2 Install Docker

**Note**: Docker helps us to build a virtual environment with all the required dependencies for running our programs. 

Choose your OS and follow the instructions:

- Ubuntu: https://docs.docker.com/engine/install/ubuntu
- Mac OS: https://docs.docker.com/desktop/install/mac-install [NOT CHECKED]
- Windows: https://docs.docker.com/desktop/install/windows-install

Go to Docker settings and enable WSL2 backend (ONLY for Windows, see below).

<p align="center">
  <img align="center" src="images/Docker WSL2 backend.png" width="75%">
</p>

#### 2.3 Configure X Window System

X Window System (or X11) is a system for remote graphical interfaces rendering and control.

It allows to forward graphics from WSL2/Docker to Host machine.

There are several options depending on OS:
- Mac OS: https://www.xquartz.org
- Windows: VcXsrv ([link](https://sourceforge.net/projects/vcxsrv/files/vcxsrv/1.20.14.0/vcxsrv-64.1.20.14.0.installer.exe/download) to download)
- Ubuntu: `sudo apt-get -y install xserver-xorg`

**Example**: VcXsrv configuration on Windows (see below, from left to right, up to bottom).

<p align="center">
  <img align="center" src="images/X11_01.png" width="45%">
  <img align="center" src="images/X11_02.png" width="45%">
</p>

<p align="center">
  <img align="center" src="images/X11_03.png" width="45%">
  <img align="center" src="images/X11_04.png" width="45%">
</p>

**Note**: it is recommended to save the X11 configuration, so that after reboot one can just click on the saved configuration to start X11 without going through the configuration steps once again.  

#### 2.4 Clone this repo

```shell
git clone https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university.git
```

or download a ZIP archive (click [here](https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university/archive/refs/heads/master.zip)).

#### 2.5 Build Docker image

Build it from source:
```shell
cd path/to/vslam-workshop-kyoto-university
chmod +x docker/build_docker.sh
./docker/build_docker.sh
```

or pull it from the Docker Hub:
```shell
docker pull chupakabra1996/orb-slam2
```

#### 2.6 Run Docker container

**Note**: set the `DISPLAY` env variables correctly beforehand. 

The script sets `DISPLAY` if it's missing, but it could be set to an incorrect value.

`DISPLAY` should be a value of format `x.x.x.x:y` where `x.x.x.x` - IP address of the Host, `y` - display number (by default: 0).

**Example** (setting env variable in the terminal): `export DISPLAY=192.168.0.3:0`.

Run the Docker container:
```shell
chmod +x docker/run_docker.sh
./docker/run_docker.sh
```

## 3. Run ORB-SLAM2

Put ROS bag files into `datasets` directory.

**Note**: all the following instructions are executed inside the Docker container.

Reindex all the ROS bag files:
```shell
rosbag reindex datasets/<bag file>
```

(MH - optional argument to use MH dataset)

A. Launch monocular Visual SLAM (using EuRoC dataset):
```shell
./scripts/run_mono_euroc.sh [MH]
```

B. Launch Stereo Visual SLAM (using EuRoC dataset):
```shell
./scripts/run_stereo_euroc.sh [MH]
```
