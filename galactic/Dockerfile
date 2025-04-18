FROM ubuntu:focal-20241011 AS builder
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y --no-install-recommends gcc libc-dev
RUN curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c
RUN gcc -Wall /usr/local/bin/su-exec.c -o/usr/local/bin/su-exec
RUN chown root:root /usr/local/bin/su-exec
RUN chmod 0755 /usr/local/bin/su-exec

FROM ubuntu:focal-20241011 AS runner
# install the latest intel media driver to use GPU
# Avoid libGL error: failed to create dri screen
# https://bugs.launchpad.net/ubuntu/+source/intel-media-driver/+bug/2004237
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:kisak/kisak-mesa && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libegl-mesa0 && \
    rm -rf /var/lib/apt/lists/*

FROM runner
LABEL maintainer="Daisuke Sato <tiryoh@gmail.com>"
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends keyboard-configuration language-pack-en && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends wget curl git build-essential ca-certificates tzdata tmux gnupg2 \
        vim sudo lsb-release locales bash-completion zsh iproute2 iputils-ping net-tools dnsutils && \
    rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN locale-gen en_US.UTF-8
ENV ROS_DISTRO=galactic
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt-get update && \
    apt-get install -y --no-install-recommends ros-${ROS_DISTRO}-desktop && \
    apt-get install -y --no-install-recommends python3-argcomplete python3-colcon-common-extensions python3-rosdep python3-colcon-mixin python3-vcstool && \
    apt-get install -y --no-install-recommends ros-${ROS_DISTRO}-gazebo-ros-pkgs ros-${ROS_DISTRO}-xacro ros-${ROS_DISTRO}-joint-state-publisher-gui && \
    rm -rf /var/lib/apt/lists/*
RUN rosdep init && \
    rosdep update --include-eol-distros
RUN rm /etc/apt/apt.conf.d/docker-clean
COPY --from=builder /usr/local/bin/su-exec /sbin/
COPY ./ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["/bin/bash"]
