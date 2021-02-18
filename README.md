<p align="center"> 
<img src="fssim_doc/img/fssim_logo.png">
</p>


# FSSIM 
FSSIM is a vehicle simulator dedicated for Formula Student Driverless Competition. It was developed for autonomous software testing purposes and not for gaming. A version of this simulator was used to predict **lap time of *gotthard* at FSAC 2020** trackdrive with **1% accuracy**. 

This simulator is developed and tested on **Ubuntu 18.04 and ROS Melodic** and both are assumed to be already installed.

The more extensive tutorial can be found under [Wiki](fssim_doc/index.md)

FSSIM is developed by [Juraj Kabzan](https://www.linkedin.com/in/juraj-kabzan-143698a1/) as part of our work at [AMZ-Driverless](http://driverless.amzracing.ch/).

this ROS package is converted from [AMZ-Driverless](https://github.com/AMZ-Driverless/fssim)

# How to Run It in your Workspace
0. Install `sudo apt install ros-melodic-desktop-full` and `sudo apt install python-catkin-tools`
1. Clone this repository to an existing **ROS Workspace** initialized with `catkin init`
2. Run `cd BITFSDsim/src/fssim/` from home.
3. Run `source Download_model.sh` to download gazebo models or the default website will stop the simulation.
3. Run `catkin build`
4. Source the workspace
5. After successful building, run the simulator with `roslaunch fssim auto_fssim.launch`. RVIZ window will start. NOTE: You might need to untick and tick `FSSIM Track` and `RobotModel` in RVIZ in order to load the STL files. NOTE: This ` [Wrn] [ModelDatabase.cc:339] Getting models from[http://gazebosim.org/models/]. This may take a few seconds.` will stop the simulation. Check step.2, or disconnect the Internet and go on.
6. The terminal will inform you what is happening. The loading time takes around 20 seconds. When `Sending RES GO` show up in the terminal, you can start controlling the vehicle with `/fssim/cmd` topic.

# Combine it with simple FSD skeleton Framework and drive a lap
0. Install `sudo apt install ros-melodic-desktop-full` and `sudo apt install python-catkin-tools`
1. [Clone the BITFSD Algorithm](https://github.com/bitfsd/fsd_algorithm).
2. For more details, please go to fsd_algorithm package.


# Features
* This simulator is targeted for FSD competition, thus it contains some of the real-car safety features
  * **RES (Remote Emergency Stop)**: The vehicle will not be able to be controlled if a `/fssim/res_state/push_button = true` is not sent. On the other side, if  `/fssim/res_state/emergency = true` is send, the vehicle will stop immediately. If you start FSSIM with `roslaunch fssim auto_fssim.launch` or through `fssim_interface` this is done automatically.
  * **Leaving Track**: If the simulation is started with `auto_fssim.launch`, an automated RES person is launched. This means, if the vehicle exists the track with all four wheels, RES-emergency will be send and the simulation will exit itself
* FSSIM does not simulate the RAW sensors! It uses a **cone-sensor-model** instead. This means a cone observations around the vehicle are simulated with numerous noise-models.  The configuration file for this sensors can be found in [fssim_description/cars/gotthard/config/sensors.yaml](fssim_description/cars/gotthard/config/sensors.yaml). Thanks to this simplification it is real-time capable
* FSSIM does not use GAZEBO Physics Engine to simulate the vehicle. Instead, it uses a basic **vehicle model** which is discretized with Euler Forward discretization and overwrites the model pose. This feature allows the simulated model to match closely the real world car.
* **Automated Run** of multiple scenarios with different configurations and save logs as well as report.
* Lap-time counter

# Known problems
* The update rate of TF between wheels and main chassis is too low or too rough. This causes jumps of wheels at higher speeds in RViZ. This influences only the visualization and not the functionality. 

# Example
<p align="center"> 
<img src="fssim_doc/img/fssim_demo.gif" width="700" />
</p>

A note: this is a public copy of a private version. The public version might have some internal functionality removed.
FSSIM was developed by

<p align="center"> 
<img src="fssim_doc/img/BITFSD Racing Team.png">
</p>

