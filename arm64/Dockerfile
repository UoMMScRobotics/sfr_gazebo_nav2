FROM ghcr.io/uommscrobotics/sfr_ros2:arm64
LABEL authors="Murilo Marinho"

ENTRYPOINT ["/bin/bash", "-c"]

RUN wget https://raw.githubusercontent.com/UoMMScRobotics/SFR_Gazebo/refs/heads/main/install_gazebo.sh && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
RUN chmod +x install_gazebo.sh && bash -c "./install_gazebo.sh"
