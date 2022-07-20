FROM osrf/ros:kinetic-desktop-full

# Set working directory
WORKDIR /home

RUN apt-get update && apt-get install -qq -y \
    git nano tree libgl1-mesa-glx libgl1-mesa-dri mesa-utils libgl1-mesa-dev libglew-dev

# Install Pangolin (modified version)
RUN git clone --recursive https://github.com/ramsafin/Pangolin.git

RUN cd Pangolin \
    && ./scripts/install_prerequisites.sh recommended \
    && git checkout d9daba6 \
    && mkdir build && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && make install

# Install ORB-SLAM2 (modified version)
RUN git clone https://github.com/ramsafin/ORB_SLAM2.git

RUN /bin/bash -c '. /opt/ros/${ROS_DISTRO}/setup.bash; cd /home/ORB_SLAM2; chmod +x build.sh; ./build.sh'
RUN /bin/bash -c '. /opt/ros/${ROS_DISTRO}/setup.bash; cd /home/ORB_SLAM2; chmod +x build_ros.sh; ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${PWD}/Examples/ROS ./build_ros.sh'

# Cleanup
RUN rm -rf /var/lib/apt/lists/*
