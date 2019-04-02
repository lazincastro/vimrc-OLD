#!/usr/bin/env sh
#
# Simple scritp to install and configure vimrc
# https://github.com/lazarocastro/vimrc
# By Lazaro Castro
# 2019-04-02 
#
# Tested on Ubuntu 18.04

# Update the system
sudo apt-get -qq update
# Install Vim if you don't have.
sudo apt-get install vim 
# To work propely, I recomend to you install these programns below:
# OBS.: The first 6 programs are required, the rest of them are cosmetic issue.
sudo apt-get -qq install \
curl \
exuberant-ctags \
git \
ack-grep \
ripgrep \
python-pip \
tree \
terminator \
python-fontforge \
zsh \
zsh-syntax-highlighting \
zsh-theme-powerlevel9k \
powerline \
fonts-powerline
# You'll need of these to work with python scripts/programns.
sudo pip -q install pep8 flake8 pyflakes isort yapf
echo "Install Python requireds. Done"
echo "Download vimrc..."
# Download vimrc
curl -s https://raw.githubusercontent.com/lazarocastro/vimrc/master/vimrc -o ~/.vimrc
vim +qa
clear
echo "Installation Completed!"
rm wget-log
rm install.sh
