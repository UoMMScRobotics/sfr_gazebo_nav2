# SFR Gazebo

Always use this command to prevent inaccessible containers.

```commandline
mkdir -p ~/docker/SFR_Gazebo
cd ~/docker/SFR_Gazebo
wget https://raw.githubusercontent.com/UoMMScRobotics/SFR_Gazebo/refs/heads/main/compose.yml
xhost +
docker compose down --remove-orphans
docker compose pull
docker compose run gazebo "gz sim"
```


