FROM osrf/ros:kinetic-desktop-full

# Set working directory
WORKDIR /home

RUN apt-get update && apt-get install -qq -y \
    git nano tree libgl1-mesa-glx libgl1-mesa-dri mesa-utils libgl1-mesa-dev libglew-dev

# Install Pangolin (modified version)
COPY Pangolin /home/Pangolin

RUN cd Pangolin \
    && ./scripts/install_prerequisites.sh recommended \
    && mkdir build && cd build \
    && cmake .. \
    && make -j$(nproc) \
    && make install

# Install ORB-SLAM2 (modified version)
COPY ORB_SLAM2 /home/ORB_SLAM2

RUN /bin/bash -c '. /opt/ros/${ROS_DISTRO}/setup.bash; cd /home/ORB_SLAM2; chmod +x build.sh; ./build.sh'
RUN /bin/bash -c '. /opt/ros/${ROS_DISTRO}/setup.bash; cd /home/ORB_SLAM2; chmod +x build_ros.sh; ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:${PWD}/Examples/ROS ./build_ros.sh'

COPY --chmod=777 scripts /home/scripts

# Cleanup
RUN rm -rf /var/lib/apt/lists/*
