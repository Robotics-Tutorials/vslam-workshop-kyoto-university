# CV 2021 Visual SLAM Workshop

## Getting Started

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
