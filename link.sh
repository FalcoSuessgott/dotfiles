#!/bin/bash
#
#   Installs dependencies 
#   Links dotfiles
# 
#   Tom Morelly
#   tom-morelly@gmx.de
#   12032020
#
###################################################

function main(){
  ln -sfv ~/dotfiles/dotfiles/vimrc ~/.vimrc
  ln -sfv ~/dotfiles/dotfiles/profile ~/.profile
  ln -sfv ~/dotfiles/dotfiles/bashrc ~/.bashrc
  ln -sfv ~/dotfiles/dotfiles/bash_aliases ~/.bash_aliases
  ln -sfv ~/dotfiles/dotfiles/gitconfig ~/.gitconfig
  ln -sfv ~/dotfiles/zsh_custom_plugins/git ~/.oh-my-zsh/custom/plugins/.
  ln -sfv ~/dotfiles/zsh_custom_plugins/git-flow-completion ~/.oh-my-zsh/custom/plugins/.
  ln -sfv ~/dotfiles/config/bspwmrc ~/.config/bspwm/.
  ln -sfv ~/dotfiles/config/sxhkd/sxhkdrc ~/.config/sxhkdrc/.
  ln -sfv ~/dotfiles/config/polybar/config ~/.config/polybar/.
  ln -sfv ~/dotfiles/config/polybar/launch.sh ~/.config/polybar/.
  ln -sfv ~/dotfiles/config/.xinitrc ~/.
  ln -sfv ~/dotfiles/config/Xresources ~/.
}

main 
