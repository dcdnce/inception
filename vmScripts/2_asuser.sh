#!/bin/bash

echo -e "\e[31mTo run being in sudo group.\e[0m"
echo -e "\e[32mInstalling vundle-vim...\e[0m"
sleep 2
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "\e[32mConfiguring git credentials\e[0m"
sleep 1
git config --global user.email "pforesti@student.42nice.fr"
git config --global user.name "pforesti"

echo -e "\e[32mConfiguring .vimrc\e[0m"
sleep 1
git clone https://github.com/dcdnce/dotfiles.git
cp dotfiles/.vimrc ~/
sudo rm -rf dotfiles/
echo -e "\e[31mDon't forget to update Vundlevim.\e[0m"

echo -e "\e[32mInstalling zsh & oh-my-zsh...\e[0m"
sleep 1
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

