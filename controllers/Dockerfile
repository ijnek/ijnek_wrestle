FROM ghcr.io/ijnek/wrestling_image:main

# Add vscode user with same UID and GID as your host system
# (copied from https://code.visualstudio.com/remote/advancedcontainers/add-nonroot-user#_creating-a-nonroot-user)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
# Switch from root to user
USER $USERNAME

# Environment variables needed for Webots
# https://cyberbotics.com/doc/guide/running-extern-robot-controllers#remote-extern-controllers
ENV PYTHONPATH=${WEBOTS_HOME}/lib/controller/python
ENV PYTHONIOENCODING=UTF-8
ENV LD_LIBRARY_PATH=${WEBOTS_HOME}/lib/controller:${LD_LIBRARY_PATH}
ARG WEBOTS_CONTROLLER_URL
ENV WEBOTS_CONTROLLER_URL=${WEBOTS_CONTROLLER_URL}

# Copies all the files of the controllers folder into the docker container
RUN sudo mkdir -p /usr/local/webots-project/controllers
ARG USERNAME=vscode
COPY --chown=$USERNAME:$USERNAME . /usr/local/webots-project/controllers

# Build workspace
RUN source /opt/ros/rolling/setup.bash && \
    cd /home/vscode/ws && \
    rosdep install --from-paths src -i -y -r && \
    colcon build --packages-up-to wrestle

# Source the ROS rolling setup file, run the controller in the background, and ROS launch in foreground
WORKDIR /usr/local/webots-project/controllers/participant
ENTRYPOINT [ "/usr/local/webots-project/controllers/participant/start.sh" ]
