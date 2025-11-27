# ros_gz_project_template
A template project integrating ROS 2 and Gazebo simulator.

## Included packages

* `ros_gz_example_description` - holds the sdf description of the simulated system and any other assets.

* `ros_gz_example_gazebo` - holds gazebo specific code and configurations. Namely this is where systems end up.

* `ros_gz_example_application` - holds ros2 specific code and configurations.

* `ros_gz_example_bringup` - holds launch files and high level utilities.


## Usage

### Baselines

For using the template with Gazebo Fortress switch to the `fortress` branch of this repository, otherwise use the default branch `main` for Gazebo Harmonic onwards.

### Use as template

Directly `Use this template` and create your project repository on Github.

Or start by creating a workspace and cloning the template repository:

   ```bash
   mkdir -p ~/template_ws/src
   cd ~/template_ws/src
   git clone https://github.com/gazebosim/ros_gz_project_template.git
   ```

## Install

To install the project build with this template, you will need to build and install the ROS modules from sources.
You can do it locally or in a Dev Container.

### Requirements

TODO: Summary


### Local Setup

1. Choose a ROS and Gazebo combination https://gazebosim.org/docs/latest/ros_installation

   Note: If you're using a specific and unsupported Gazebo version with ROS 2, you might need to set the `GZ_VERSION` environment variable, for example:

    ```bash
    export GZ_VERSION=harmonic
    ```
    Also need to build [`ros_gz`](https://github.com/gazebosim/ros_gz) and [`sdformat_urdf`](https://github.com/ros/sdformat_urdf) from source if binaries are not available for your chosen combination.

1. Install necessary tools

    ```bash
    sudo apt install python3-vcstool python3-colcon-common-extensions git wget
    ```

1. Install dependencies

    ```bash
    cd ~/template_ws
    source /opt/ros/$ROS_DISTRO/setup.bash
    sudo rosdep init
    rosdep update
    rosdep install --from-paths src --ignore-src -r -i -y --rosdistro <ROS_DISTRO>
    ```

### Dev Containers

The template includes the Dev Container that provides the containerized developer environment for developing ROS2 projects,
and simulating them with Gazebo.
This environment can be used in CLI, or within your IDE.

If you are not familiar with Dev Containers or Docker,
[here is](https://youtu.be/dihfA7Ol6Mw?si=JRc0GdexlUdokSYK) a quick introduction to ROS development in a Dev Container. 
For quick start, use this Dev Container with Visual Studio Code.

1. Open the project in Visual Studio Code
2. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
3. Reopen the project in a container (click _Reopen in Container_ in the task or popup)

For more details about the container internals, see the [Dev Container Doc](./.devcontainer/README.md).


## Usage

### Build the project

    ```bash
    colcon build --cmake-args -DBUILD_TESTING=ON
    ```

### Source the workspace

    ```bash
    . ${REPO_ROOT}/install/setup.sh
    ```

### Launch the simulation

    ```bash
    ros2 launch ros_gz_example_bringup diff_drive.launch.py
    ```

#### Simulation in the Dev Container

When running in the Dev Container, you can also connect the display using X11.
To do so on MacOS, you will need to install XQuartz locally and enable inbound connections:

```bash
brew install xquartz
open -a XQuartz
```

After that, you will need to allow inbound connections in XQuartz.
You can do it in _XQuartz Preferences_ -> _Security tab_.

### More options

For a more detailed guide on using this template see [documentation](https://gazebosim.org/docs/latest/ros_gz_project_template_guide).


## Contributing

Any contributions to this template are welcome!
Just submit a pull request.

The main codebase is licensed under the [Apache License v2](./LICENSE).
The Dev container codebase has the [MIT license](./dev)
