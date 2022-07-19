#!/bin/bash

_CURR_DIR="${PWD}"
_DEPS_PATH="${_CURR_DIR}/deps"

# 1. Clone SLAM repo
_SLAM_PATH="${_CURR_DIR}/ORB_SLAM3"

if [ -d "${_SLAM_PATH}" ]; then
  echo "${_SLAM_PATH} already exists" 1>&2
else
  git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git "${_SLAM_PATH}"
fi

# 2. Build and install Pangolin
echo "Installing ORB-SLAM3 dependencies ..."

# sudo apt install -y build-essential ninja-build
mkdir -pv "${_DEPS_PATH}"

# 2.A. Pangolin (for visualization)
_DEPS_PANGOLIN_PATH="${_DEPS_PATH}/Pangolin"

if [ -d "${_DEPS_PANGOLIN_PATH}" ]; then
  echo "${_DEPS_PANGOLIN_PATH} already exists" 1>&2
else
  git clone --recursive https://github.com/stevenlovegrove/Pangolin.git "${_DEPS_PANGOLIN_PATH}"
fi

"${_DEPS_PANGOLIN_PATH}"/scripts/install_prerequisites.sh recommended

cd "${_DEPS_PANGOLIN_PATH}" 
cmake -B build -G Ninja
cmake --build build -j $(nproc) --config Release
sudo cmake --install build

sudo ldconfig

# 2.B. Build DBoW2, G2O, and ORB-SLAM3
cd "${_SLAM_PATH}"
chmod +x build.sh
./build.sh

