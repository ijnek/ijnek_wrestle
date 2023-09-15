# FROM ghcr.io/ijnek/wrestling_image:main
FROM ghcr.io/ijnek/wrestling_image@sha256:06a56f6ee704e3c9422be840a818d02aca65f08386f0e86b7ffbf1d2317536e4

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
