FROM --platform=linux/${TARGETARCH} ros:kilted-ros-base-noble

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

# Delete user if it exists in container (e.g Ubuntu Noble: ubuntu)
RUN if id -u $USER_UID; then userdel `id -un $USER_UID`; fi

# Create the user
RUN \
  groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME

# Install sudo and add user to sudoers
RUN apt-get update && apt-get install -y sudo wget && \
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
  chmod 0440 /etc/sudoers.d/$USERNAME

# Add Gazebo repos
RUN echo "Configuring extra apt source repositories" && \
  echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list && \
  wget https://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -

# Install dependencies and some tools
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt-get update && apt-get install -y \
    ssh git bash ccache htop curl  \
    build-essential cmake pkg-config gdb \
    python3 python3-pip python3-venv python3-vcstool python3-colcon-common-extensions python3-debugpy \
    gz-jetty libboost-all-dev libgz-plugin2-dev libgz-common5-dev libgz-sim8-dev  \

# Source ROS environment automatically
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash # ROS_SETUP_SCRIPT" >> /home/$USERNAME/.bashrc

# TODO: Bootstrap ROS here, for most dependencies

ENV SHELL=/bin/bash
USER $USERNAME

CMD ["/bin/bash"]
