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

SRC="dotfiles"
ZSH_CUSTOM=".oh-my-zsh/custom"

function link(){
    # $1 src
    # $2 dest
    ln -sfv ~/$SRC/$1 ~/$2
}

function main(){
  # Oh my zsh
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Powerlevel10k
  # git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    
  # dotfiles
  ln -sfv ~/dotfiles/dotfiles/zshrc ~/.zshrc
  ln -sfv ~/dotfiles/dotfiles/vimrc ~/.vimrc
  ln -sfv ~/dotfiles/dotfiles/profile ~/.profile
  ln -sfv ~/dotfiles/dotfiles/bashrc ~/.bashrc
  ln -sfv ~/dotfiles/dotfiles/bash_aliases ~/.bash_aliases
  ln -sfv ~/dotfiles/dotfiles/gitconfig ~/.gitconfig

  # zsh plugins
  ln -sfv ~/dotfiles/zsh_custom_plugins/git ~/.oh-my-zsh/custom/plugins/.
  ln -sfv ~/dotfiles/zsh_custom_plugins/git-flow-completion ~/.oh-my-zsh/custom/plugins/.

  # configs
  ln -sfv ~/dotfiles/config/bspwmrc ~/.config/bspwm/.
  ln -sfv ~/dotfiles/config/sxhkd/sxhkdrc ~/.config/sxhkdrc/.
}

main 
