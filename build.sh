#!/usr/bin/env bash
set -eux

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

sudo apt-get install -y qemu-user-static
cp /usr/bin/qemu-aarch64-static $SRC_DIR/arm64
cd $SRC_DIR/amd64 && docker build -t ros2:x64-$TARGET .
cd $SRC_DIR/arm64 && docker build -t ros2:arm64v8-$TARGET .
docker tag ros2:x64-$TARGET $DOCKER_USERNAME/ros2:x64-$TARGET
docker tag ros2:arm64v8-$TARGET $DOCKER_USERNAME/ros2:arm64v8-$TARGET
docker images
if [[ "$TRAVIS_PULL_REQUEST" == "false" ]] && [[ ! $(echo $TARGET | grep -e 'test' | grep -v 'latest') ]]; then
	echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
	docker push $DOCKER_USERNAME/ros2:arm64v8-$TARGET
	docker push $DOCKER_USERNAME/ros2:x64-$TARGET
	docker manifest create --amend $DOCKER_USERNAME/ros2:$TARGET $DOCKER_USERNAME/ros2:arm64v8-$TARGET $DOCKER_USERNAME/ros2:x64-$TARGET
	docker manifest annotate $DOCKER_USERNAME/ros2:$TARGET $DOCKER_USERNAME/ros2:arm64v8-$TARGET --arch arm64 
	docker manifest push $DOCKER_USERNAME/ros2:$TARGET
fi
