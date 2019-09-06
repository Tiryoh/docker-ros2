#!/usr/bin/env bash
set -eux

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

IS_PULL_REQUEST=${TRAVIS_PULL_REQUEST:-""}
GIT_BRANCH=${TRAVIS_BRANCH:-$(git rev-parse --abbrev-ref @ 2>/dev/null)}
IS_LATEST=${APPLY_LATEST_TAG:-""}

sudo apt-get install -y qemu-user-static
cp /usr/bin/qemu-aarch64-static $SRC_DIR/ubuntu/bionic/arm64/$ROS_DISTRO/
pushd $SRC_DIR/ubuntu/bionic/amd64/$ROS_DISTRO/ && docker build -t ros2:amd64-$ROS_DISTRO . && popd
pushd $SRC_DIR/ubuntu/bionic/arm64/$ROS_DISTRO/ && docker build -t ros2:arm64-$ROS_DISTRO . && popd
docker tag ros2:amd64-$ROS_DISTRO $DOCKER_USERNAME/ros2:amd64-$ROS_DISTRO
docker tag ros2:arm64-$ROS_DISTRO $DOCKER_USERNAME/ros2:arm64-$ROS_DISTRO
docker images
if [[ "$IS_PULL_REQUEST" == "false" ]] && [[ "$GIT_BRANCH" == "master" ]]; then
	echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
	docker push $DOCKER_USERNAME/ros2:arm64-$ROS_DISTRO
	docker push $DOCKER_USERNAME/ros2:amd64-$ROS_DISTRO
	docker manifest create --amend $DOCKER_USERNAME/ros2:$ROS_DISTRO $DOCKER_USERNAME/ros2:arm64-$ROS_DISTRO $DOCKER_USERNAME/ros2:amd64-$ROS_DISTRO
	docker manifest annotate $DOCKER_USERNAME/ros2:$ROS_DISTRO $DOCKER_USERNAME/ros2:arm64-$ROS_DISTRO --arch arm64 
	docker manifest push $DOCKER_USERNAME/ros2:$ROS_DISTRO
	if [[ "$IS_LATEST" == "true" ]]; then
		docker tag $DOCKER_USERNAME/ros2:amd64-$ROS_DISTRO $DOCKER_USERNAME/ros2:amd64-latest
		docker tag $DOCKER_USERNAME/ros2:arm64-$ROS_DISTRO $DOCKER_USERNAME/ros2:arm64-latest
		docker push $DOCKER_USERNAME/ros2:amd64-latest
		docker push $DOCKER_USERNAME/ros2:arm64-latest
		docker manifest create --amend $DOCKER_USERNAME/ros2:latest $DOCKER_USERNAME/ros2:arm64-latest $DOCKER_USERNAME/ros2:amd64-latest
		docker manifest annotate $DOCKER_USERNAME/ros2:latest $DOCKER_USERNAME/ros2:arm64-latest --arch arm64 
		docker manifest push $DOCKER_USERNAME/ros2:latest
	fi
fi
