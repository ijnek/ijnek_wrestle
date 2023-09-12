#!/usr/bin/env bash
nohup python3 participant.py &
source /home/vscode/ws/install/setup.bash && ros2 launch wrestle all.launch.py
