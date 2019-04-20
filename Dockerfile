FROM tiryoh/ubuntu:dev-bionic

RUN git clone https://github.com/Tiryoh/ros2_setup_scripts_ubuntu.git && cd ros2_setup_scripts_ubuntu && ./run.sh
