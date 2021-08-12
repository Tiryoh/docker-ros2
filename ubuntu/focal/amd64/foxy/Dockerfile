FROM ubuntu:20.04
LABEL maintainer="Tiryoh <tiryoh@gmail.com>"
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "Set disable_coredump false" >> /etc/sudo.conf
RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq keyboard-configuration && \
    apt-get install -yq wget curl git build-essential vim sudo lsb-release locales bash-completion tzdata gosu && \
    rm -rf /var/lib/apt/lists/*
RUN useradd --create-home --home-dir /home/ubuntu --shell /bin/bash --user-group --groups adm,sudo ubuntu && \
    echo ubuntu:ubuntu | chpasswd && \
    echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN locale-gen en_US.UTF-8
RUN git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git /tmp/ros2_setup_scripts_ubuntu && \
    gosu ubuntu /tmp/ros2_setup_scripts_ubuntu/ros2-foxy-desktop-main.sh && \
    rm -rf /var/lib/apt/lists/*
COPY ./ros_entrypoint.sh /
USER ubuntu
WORKDIR /home/ubuntu
ENV HOME=/home/ubuntu
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
