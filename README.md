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
### Run the Docker image
```shell
cd ~/cv2021-vslam-workshop
./run_docker
```
