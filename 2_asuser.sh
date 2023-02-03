#!/bin/bash

echo -e "\e[31mTo run being in sudo group.\e[0m"
echo -e "\e[32mInstalling vundle-vim...\e[0m"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo -e "\e[32mConfiguring git credentials\e[0m"
git config --global user.email "pforesti@student.42nice.fr"
git config --global user.name "pforesti"
