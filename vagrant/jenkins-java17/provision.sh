#!/bin/bash

#####################################################################################################
# Java 17
#####################################################################################################
wget https://download.oracle.com/java/17/archive/jdk-17.0.3_linux-x64_bin.deb
apt install ./jdk-17.0.3_linux-x64_bin.deb -y
echo 'export JAVA_HOME=/usr/lib/jvm/jdk-17' | tee -a /etc/profile
echo 'export PATH=$PATH:$JAVA_HOME/bin' | tee -a /etc/profile
source /etc/profile

#####################################################################################################
# Apache Maven 3.8.6
#####################################################################################################
wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
tar xf apache-maven-3.8.6-bin.tar.gz -C /opt
echo 'export MAVEN_HOME=/opt/apache-maven-3.8.6' | tee -a /etc/profile
echo 'export PATH=$PATH:$MAVEN_HOME/bin' | tee -a /etc/profile
source /etc/profile

#####################################################################################################
# Jenkins
#####################################################################################################
apt install openjdk-11-jre -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null
apt update
apt install fontconfig -y
apt install jenkins -y

