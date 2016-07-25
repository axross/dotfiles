#!/bin/bash

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.npmrc ~/.npmrc
ln -s ~/.dotfiles/.config ~/.config

brew install coreutils fish git openssh

source ~/.config/fish/config.fish