# Visual SLAM Workshop at Kyoto University 2022

## Getting Started

### 1. Install Docker

Choose your OS and follow the instructions:

- Ubuntu: https://docs.docker.com/desktop/install/ubuntu
- Mac OS: https://docs.docker.com/desktop/install/mac-install
- Windows: https://docs.docker.com/desktop/install/windows-install

**Note**: Windows users are encouraged to install [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701?hl=ja-jp&gl=JP)

### 2. Clone this repo

```shell
git clone https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university.git
```

or download a ZIP archive (click [here](https://github.com/Robotics-Tutorials/vslam-workshop-kyoto-university/archive/refs/heads/master.zip)).

### 3. Build Docker image

```shell
cd path/to/vslam-workshop-kyoto-university
chmod +x build_docker.sh
./build_docker.sh
```

### 4. Prepare datasets

Datasets can be downloaded [here](https://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets).
In this workshop we will use [`Vicon Room 1 01`](http://robotics.ethz.ch/~asl-datasets/ijrr_euroc_mav_dataset/machine_hall/MH_01_easy/MH_01_easy.bag) and [`Machine Hall 01`](http://robotics.ethz.ch/~asl-datasets/ijrr_euroc_mav_dataset/vicon_room1/V1_01_easy/V1_01_easy.bag) ROS bag files.

Put the downloaded ROS bag files inside the `datasets` folder.

After this step there should be 2 files `datasets/MH_01_easy.bag` and  `datasets/V1_01_easy.bag`

### 5. Run SLAM

Run the Docker container:
```shell
chmod +x run_docker.sh 
./run_docker.sh
```

Reindex all the ROS bag files (reason: bag layout changes with ROS distributions):
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
