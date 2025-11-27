#!/bin/bash
set -e
set -x

# Initialize and update the ROS environment
rosdep update
rosdep install --from-paths . --ignore-src -r -i -y --rosdistro ${containerEnv::ROS_VERSION}

# FIXME: Why does not it install libgz-plugin2-dev libgz-common5-dev libgz-sim8-dev  ?
