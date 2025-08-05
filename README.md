# SFR Gazebo

## Download

```commandline
mkdir -p ~/git
cd ~/git
git clone https://github.com/UoMMScRobotics/SFR_Gazebo.git
```

## Run

Always use this command to prevent inaccessible containers.

```commandline
cd ~/git/SFR_Gazebo
xhost +
docker compose down --remove-orphans
docker compose run gazebo "gz sim"
```


