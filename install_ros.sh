#!/usr/bin/env bash
set -eu

# Reference: https://github.com/Tiryoh/ros_setup_scripts_ubuntu/blob/master/ros-noetic-desktop-main.sh

ROS_DISTRO=kinetic
ROS_PACKAGE=desktop-full

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-get install -y curl
curl -k https://raw.githubusercontent.com/ros/rosdistro/master/ros.key | sudo apt-key add -
sudo apt-get update || echo ""

sudo apt-get install -y ros-${ROS_DISTRO}-${ROS_PACKAGE}
sudo apt-get install -y python3-rosdep

ls /etc/ros/rosdep/sources.list.d/20-default.list > /dev/null 2>&1 && sudo rm /etc/ros/rosdep/sources.list.d/20-default.list
sudo rosdep init
rosdep update

sudo apt-get install -y python3-rosinstall python3-rosinstall-generator python3-wstool build-essential python3-vcstool
sudo apt-get install -y python3-catkin-tools python3-osrf-pycommon
sudo apt-get install ninja-build liburdfdom-tools

grep -F "source /opt/ros/${ROS_DISTRO}/setup.bash" ~/.bashrc ||
echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

grep -F `catkin locate --shell-verbs` ~/.bashrc ||
echo "source `catkin locate --shell-verbs`" >> ~/.bashrc

grep -F `export ROS_LANG_DISABLE=geneus:genlisp:gennodejs` ~/.bashrc ||
echo "export ROS_LANG_DISABLE=geneus:genlisp:gennodejs" >> ~/.bashrc

echo ""
echo "Success installing ROS ${ROS_DISTRO}-${ROS_PACKAGE}"
echo "Run 'source ~/.bashrc'"
echo ""
echo "If any error occurs, please refer to the following URL."
echo "http://wiki.ros.org/noetic/Installation"
echo ""
