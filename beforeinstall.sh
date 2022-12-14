#!/bin/bash -xe
cd /home/ubuntu
sudo rm -rf *
sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo apt install -y apache-maven
sudo apt install java-1.8.0-openjdk-devel.x86_64 -y
PID=`ps -eaf | grep webapp | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo "killing $PID"
  kill -9 $PID
fi
