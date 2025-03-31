#!/bin/bash

zshrc="$HOME/.zshrc"
zshrc_backup="$zshrc.bck"
RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"
PREFIX="$RED[+]$GREEN"

echo -e "$PREFIX Update and upgrading packages$NC"
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade

echo -e "$PREFIX Installing ZSH and fzf$NC"
sudo apt install -y zsh fzf

echo -e "$PREFIX Installing Oh My ZSH fzf$NC"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo -e "$PREFIX Installing ZSH theme$NC"
cp ./imozsh.zsh-theme ~/.oh-my-zsh/themes

echo -e "$PREFIX Making a backup for $zshrc file$NC"
cp "$zshrc" "$zshrc_backup"

echo -e "$PREFIX Setting up themes and plugins$NC"
sed -i 's/^ZSH_THEME="[^"]*"/ZSH_THEME="imozsh"/' "$zshrc"
sed -i 's/^plugins=([^)]*)/plugins=(git docker docker-compose zsh-interactive-cd)/' "$zshrc"
