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
docker run -it tiryoh/ros2:jazzy
```

or

```sh
docker run -it tiryoh/ros2:humble
```

## Usage

* specify username, UID and GID.

  ```
  $ docker run --rm -it -e USER=dev -e USER_UID=1001 -e USER_GID=1001 tiryoh/ros2:humble
  ```

## Docker Tags

* [`jazzy`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=jazzy), [`latest`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=latest)
* [`humble`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=humble)
* [`galactic`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=galactic)
* [`foxy`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=foxy)
* [`eloquent`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=eloquent)
* [`dashing`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=dashing)
* [`crystal`](https://hub.docker.com/r/tiryoh/ros2/tags?page=1&name=crystal)

Docker tags and build logs are listed on this page.  
https://github.com/Tiryoh/docker-ros2/wiki

## LICENSE

This repository is released under the Apache License 2.0, see [LICENSE](./LICENSE).  
Unless attributed otherwise, everything in this repository is under the Apache License 2.0.

```
Copyright 2019-2024 Tiryoh <tiryoh@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
