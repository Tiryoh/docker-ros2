# docker_ros2

*unofficial* ROS2 Dockerfile

[![](https://img.shields.io/docker/pulls/tiryoh/ros2.svg)](https://hub.docker.com/r/tiryoh/ros2)

## Quick Start

After installing docker, just run the followings.

```sh
docker run -it tiryoh/ros2:dashing
```

or

```sh
docker run -it tiryoh/ros2:eloquent
```

## Docker Tags

* eloquent
  * [amd64-eloquent](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/eloquent/Dockerfile)
  * [arm64-eloquent](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/eloquent/Dockerfile)
* dashing, latest
  * [amd64-dashing, amd64-latest](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/dashing/Dockerfile)
  * [arm64-dashing, arm64-latest](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/dashing/Dockerfile)
* crystal
  * [amd64-crystal](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/crystal/Dockerfile)
  * [arm64-crystal](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/crystal/Dockerfile)

build and push logs are available from here: https://travis-ci.com/Tiryoh/docker_ros2/builds

## LICENSE

(C) 2019 Tiryoh

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.
