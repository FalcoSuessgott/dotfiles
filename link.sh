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
SRC="$HOME/git/dotfiles/config"

function link(){
    ln -sfv $SRC/$1 ~/$2
}

function main(){

    link bash/bashrc .bashrc
    link bash/bash_aliases .bash_aliases

    link bspwm/bspwmrc .config/bspwm//.
    
    link git/gitconfig .gitconfig

    link polybar/config .config/polybar/.
    link polybar/launch.sh .config/polybar/.

    link profile .profile

    link sxhkd/sxhkdrc .config/sxhkd/.

    link vim/vimrc .vimrc

    link Xresources .Xresources

    link zsh/zshrc .zshrc
    link zsh/zsh_custom_plugins/git .oh-my-zsh/custom/plugins/.
    link zsh/zsh_custom_plugins/git-flow-completion .oh-my-zsh/custom/plugins/.
}

main 
