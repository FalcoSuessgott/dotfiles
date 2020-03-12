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
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

  ln -sfv ~/dotfiles/dotfiles/* ~/.*
  ln -sfv ~/dotfiles/zsh_custom_plugins/* ~/.oh-my-zsh/custom/plugins/.*
}

main 
