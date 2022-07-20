# Visual SLAM Workshop at Kyoto University 2022

## Getting Started

### Install Docker

Choose your OS and follow the instructions:

- Ubuntu: https://docs.docker.com/desktop/install/ubuntu
- Mac OS: https://docs.docker.com/desktop/install/mac-install
- Windows: https://docs.docker.com/desktop/install/windows-install

Note: Windows users are encouraged to install [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=ja-jp&gl=JP)

### Clone this repo

```shell
git clone https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university.git
```

or download a ZIP archive by clicking "Code" > "Download ZIP".

### Prepare Docker image

```shell
cd ~/vslam-workshop-kyoto-university
chmod +x build_docker.sh
./build_docker.sh
```

## Run SLAM

Run the Docker container:
```shell
chmod +x run_docker.sh 
./run_docker.sh
```

Launch ORB_SLAM2 (inside the container):

Monoculary Visual SLAM (using EuRoC dataset):
```shell
./scripts/run_mono_euroc.sh
```

Stereo Visual SLAM (using EuRoC dataset):
```shell
./scripts/run_stereo_euroc.sh
```
