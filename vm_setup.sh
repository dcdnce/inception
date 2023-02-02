#!/bin/bash
if [ "$EUID" -ne 0 ]
	then echo -e "\e[31mPlease run as root.\e[0m"
	exit
fi

echo -e "\e[32mAdding user to sudo group...\e[0m"
sleep 1 
usermod -aG sudo pforesti

echo -e "\e[32mInstalling git, vim, and vundle-vim...\e[0m"
sleep 2
sudo apt install git vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "\e[32mInstalling docker\e[0m"
sleep 2
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo -e "\e[32mRunning docker...\e[0m"
sudo docker run hello-world
