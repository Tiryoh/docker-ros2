# docker-ros2

__unofficial__ ROS2 Dockerfile

There are official Docker images provided by OSRF.  
https://github.com/osrf/docker_images/blob/master/README.md#official-library

This image is developed to force `ubuntu` user (uid=1000, gid=1000) to run the software. If you want to run the software for other users, it is easier to use the official image.

![Docker Automated build](https://img.shields.io/docker/automated/tiryoh/ros2)
[![Deploy](https://github.com/Tiryoh/docker_ros2/workflows/Deploy/badge.svg?branch=master)](https://github.com/Tiryoh/docker_ros2/actions?query=workflow%3ADeploy+branch%3Amaster)
[![](https://img.shields.io/docker/pulls/tiryoh/ros2.svg)](https://hub.docker.com/r/tiryoh/ros2)

## Quick Start

After installing docker, just run the followings.

```sh
docker run -it tiryoh/ros2:dashing
```

or

```sh
docker run -it tiryoh/ros2:foxy
```

## Docker Tags

* [`foxy`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=foxy)
  * [`amd64-foxy`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/focal/amd64/foxy/Dockerfile)
  * [`arm64-foxy`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/focal/arm64/foxy/Dockerfile)
* [`eloquent`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=eloquent)
  * [`amd64-eloquent`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/eloquent/Dockerfile)
  * [`arm64-eloquent`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/eloquent/Dockerfile)
* [`dashing`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=dashing), [`latest`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=latest)
  * [`amd64-dashing`, `amd64-latest`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/dashing/Dockerfile)
  * [`arm64-dashing`, `arm64-latest`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/dashing/Dockerfile)
* [`crystal`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=crystal)
  * [`amd64-crystal`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/amd64/crystal/Dockerfile)
  * [`arm64-crystal`](https://github.com/Tiryoh/docker_ros2/blob/master/ubuntu/bionic/arm64/crystal/Dockerfile)

Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker_ros2/wiki

## LICENSE

(C) 2019-2021 Tiryoh \<tiryoh@gmail.com\>

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.
