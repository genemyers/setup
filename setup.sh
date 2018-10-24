#!/bin/bash
# Simple setup.sh for configuring Ubuntu 14.04 LTS EC2 instance
# for headless setup. 
#
# This should be in its own Heroku option setup.sh
#
# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
# wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

sudo apt-get install -y curl

##### WAIT- SHOULD NOT NEED N and NVM !!!!!!!!!!

# Install nvm: node-version manager 0.10.0
wget https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh 
sudo sh install.sh

#The NVM setup is now done in buildscripts/stanford_dev_env.sh
# Load nvm and install latest production node
#source $HOME/.nvm/nvm.sh
#nvm install v0.10.29
#nvm use v0.10.29


# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi

git clone https://github.com/genemyers/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .


