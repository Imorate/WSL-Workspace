#!/bin/bash

zshrc="$HOME/.zshrc"
zshrc_backup="$zshrc.bck"

sudo apt update && sudo apt upgrade && sudo apt dist-upgrade
sudo apt install zsh
sudo apt install fzf
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ./imozsh.zsh-theme ~/.oh-my-zsh/themes
cp "$zshrc" "$zshrc_backup"
sed -i 's/^ZSH_THEME="[^"]*"/ZSH_THEME="imozsh"/' "$zshrc"
sed -i 's/^plugins=([^)]*)/plugins=(git docker docker-compose battery zsh-interactive-cd)/' "$zshrc"
zsh -c "source $zshrc; exec zsh"
