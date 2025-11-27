#!/bin/bash
set -e
set -x

# Initialize and update the ROS environment
rosdep update
rosdep install --from-paths . --ignore-src -r -i -y --rosdistro kilted

