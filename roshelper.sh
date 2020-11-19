#!/bin/bash
echo "ROS helper by rhdu, 2020.11.19"
echo "This young and simple bash script will help you install ROS Melodic on Ubuntu."
echo "Please input your root password."
sudo echo "Welcome."
echo "Backup /etc/apt/souces.list and change sources..."
cd /etc/apt/
sudo cp sources.list sources.list.bak
sudo chmod 777 sources.list
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ xenial main restricted universe multiverse">>sources.list
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-security main restricted universe multiverse">>sources.list
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse">>sources.list
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse">>sources.list
sudo echo "deb https://mirrors.ustc.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse">>sources.list
echo "Done."
echo "Add sources..."
sudo sh -c ‘. /etc/lsb-release && echo “deb https://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main” > /etc/apt/sources.list.d/ros-latest.list’
echo "Done."
echo "Setup keys..."
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
echo "Done."
echo "Update list..."
sudo apt update
echo "Done."
echo "Install ROS..."
sudo apt install ros-melodic-desktop-full
echo "Done."
echo "Setup environment..."
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "Done."
echo "Install dependencies..."
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt install python-rosdep
echo "Done."
echo "Backup /etc/hosts and add hosts..."
cd /etc
sudo cp hosts hosts.bak
sudo chmod 777 hosts
echo "199.232.68.133 raw.githubusercontent.com">>hosts
echo "Done."
echo "Initialize rosdep..."
sudo rosdep init
rosdep update
echo "Done."
echo "Installation complete. Farewell."