# FROM ghcr.io/ijnek/wrestling_image:main
FROM ghcr.io/ijnek/wrestling_image@sha256:a309e7177ab02198aefa4c3b347efc8917e04c01475b857eaf460808158373a0

USER root

# Environment variables needed for Webots
# https://cyberbotics.com/doc/guide/running-extern-robot-controllers#remote-extern-controllers
ENV WEBOTS_HOME=/usr/local/webots/
ENV PYTHONPATH=${WEBOTS_HOME}/lib/controller/python
ENV PYTHONIOENCODING=UTF-8
ENV LD_LIBRARY_PATH=${WEBOTS_HOME}/lib/controller:${LD_LIBRARY_PATH}
ARG WEBOTS_CONTROLLER_URL
ENV WEBOTS_CONTROLLER_URL=${WEBOTS_CONTROLLER_URL}
ENV USER=root

# Source the ROS rolling setup file, and ROS launch
CMD source /home/vscode/ws/install/setup.bash && ros2 launch wrestle all.launch.py
