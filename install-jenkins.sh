#!/bin/bash

# Update apt repositories and install OpenJDK 17
sudo apt update -y
sudo apt install openjdk-17-jre -y

# Check if Java is installed
if java -version &>/dev/null; then
  echo "Java is installed"
  
  # Install Jenkins repository
  curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
  echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
  sudo apt update
  sudo apt install jenkins -y
else
  echo "Java is not installed"
  exit 1
fi

# Install Docker
echo "------------------------- Installing Docker ---------------------------------"
sudo apt update -y
sudo apt install docker.io -y

# Add Jenkins and current user to Docker group
sudo usermod -aG docker jenkins
sudo usermod -aG docker $(whoami)

# Restart Docker service
sudo systemctl restart docker

# Verify Docker is running by checking 'hello-world' container
if sudo -u jenkins docker run hello-world &>/dev/null; then
  echo "Docker is working fine"
  echo "Jenkins installed and Docker verified."
else
  echo "Docker setup failed."
  exit 1
fi
