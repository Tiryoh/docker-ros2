# docker-ros2

![Docker Automated build](https://img.shields.io/docker/automated/tiryoh/ros2)
[![Deploy](https://github.com/Tiryoh/docker_ros2/workflows/Deploy/badge.svg?branch=master)](https://github.com/Tiryoh/docker_ros2/actions?query=workflow%3ADeploy+branch%3Amaster)
[![](https://img.shields.io/docker/pulls/tiryoh/ros2.svg)](https://hub.docker.com/r/tiryoh/ros2)

__unofficial__ ROS2 Dockerfile

There are official Docker images provided by OSRF.  
https://github.com/osrf/docker_images/blob/master/README.md#official-library

This image is developed to use `ubuntu` user (uid=1000, gid=1000) to run the software.  
If you want to run the software for other users, check [Usage](#usage) section.

## Quick Start

After installing docker, just run the followings.

```sh
docker run -it tiryoh/ros2:dashing
```

or

```sh
docker run -it tiryoh/ros2:foxy
```

## Usage

* specify username, UID and GID.

  ```
  $ docker run --rm -it -e USER=dev -e USER_UID=1001 -e USER_GID=1001 tiryoh/ros2:foxy
  ```

## Docker Tags

* [`foxy`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=foxy), [`latest`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=latest)
* [`eloquent`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=eloquent)
* [`dashing`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=dashing)
* [`crystal`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=crystal)

Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker-ros2/wiki

## LICENSE

```
(C) 2019-2021 Tiryoh <tiryoh@gmail.com>
```

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.
