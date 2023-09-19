# FROM ghcr.io/ijnek/wrestling_image:main
FROM ghcr.io/ijnek/wrestling_image@sha256:49f90fe9d7d6bf5334c49c03fbda7a828aa49f7edda616a076ff7fa9177ea736

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
