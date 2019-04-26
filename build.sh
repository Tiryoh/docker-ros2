#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

sudo apt-get install -y qemu-user-static
cp /usr/bin/qemu-aarch64-static $SRC_DIR/arm64
cd amd64 && docker build -t ros2:x64-$TARGET .
cd arm64 && docker build -t ros2:arm64v8-$TARGET .
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker images
docker tag ros2:x64-$TARGET $DOCKER_USERNAME/ros2:x64-$TARGET
docker tag ros2:arm64v8-$TARGET $DOCKER_USERNAME/ros2:arm64v8-$TARGET
[[ "$TRAVIS_PULL_REQUEST" == "false" ]] && docker push $DOCKER_USERNAME/ros2:arm64v8-$TARGET
[[ "$TRAVIS_PULL_REQUEST" == "false" ]] && docker push $DOCKER_USERNAME/ros2:x64-$TARGET
docker manifest create --amend tiryoh/ros2:$TARGET tiryoh/ros2:arm64v8-$TARGET tiryoh/ros2:x64-$TARGET
[[ "$TRAVIS_PULL_REQUEST" == "false" ]] && docker manifest push tiryoh/ros2:$TARGET
