# SFR Gazebo

> [!IMPORTANT]
> Remember to install `docker` and `curl`.
> Docker: https://ros2-tutorial.readthedocs.io/en/latest/docker/index.html
> `sudo apt-get install curl`

Recommended command to prevent inaccessible containers.

```commandline
mkdir -p ~/docker/SFR_Gazebo
cd ~/docker/SFR_Gazebo
curl -O https://raw.githubusercontent.com/UoMMScRobotics/SFR_Gazebo/refs/heads/main/compose.yml
xhost +
docker compose down --remove-orphans
docker compose pull
docker compose run gazebo "gz sim"
```

This will create a shared folder in `/home/shared` in the container that maps to the user's home folder in the host.

## Notes

- I've extensively tested it in `macos` and did not manage to make it work in `xquartz`. Tough luck.
- Changing the user to `ubuntu` in the container made `x` stop working. It would be ideal to have a different user than `root` to prevent issues with the shared folder.



