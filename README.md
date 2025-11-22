# Docker Image for Gazebo and `nav2` Used in Software for Robotics

> [!IMPORTANT]
> Remember to install `docker` and `curl`.
> 
> - Docker: https://ros2-tutorial.readthedocs.io/en/latest/docker/index.html
> 
> - curl `sudo apt-get install curl`

## Gazebo 

> [!NOTE]
> See: https://ros2-tutorial.readthedocs.io/en/latest/gazebo/installation.html

```commandline
mkdir -p ~/docker/sfr/gazebo_nav2
cd ~/docker/sfr/gazebo_nav2
curl -O https://raw.githubusercontent.com/UoMMScRobotics/sfr_gazebo_nav2/refs/heads/main/compose.yml
xhost +
docker compose down --remove-orphans
docker compose pull
docker compose run gazebo "gz sim"
```

## Navigation

> [!NOTE]
> See: https://ros2-tutorial.readthedocs.io/en/latest/gazebo/installation.html


```commandline
mkdir -p ~/docker/sfr/gazebo_nav2
cd ~/docker/sfr/gazebo_nav2
curl -O https://raw.githubusercontent.com/UoMMScRobotics/sfr_gazebo_nav2/refs/heads/main/compose.yml
xhost +
docker compose down --remove-orphans
docker compose pull
docker compose run gazebo "ros2 launch nav2_bringup tb3_simulation_launch.py slam:=True"
```

## Notes

- The compose file will create a shared folder in `/home/shared` in the container that maps to the user's home folder in the host.
- I've extensively tested it in `macos` and did not manage to make it work in `xquartz`. Tough luck.
- Changing the user to `ubuntu` in the container made `x` stop working. It would be ideal to have a different user than `root` to prevent issues with the shared folder.
- Using `export CURRENT_UID=$(id -u):$(id -g)` to set the user caused issues with `libgz-common5.so.5`.
