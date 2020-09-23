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
SRC="$HOME/git/dotfiles"

function link(){
    ln -sfv $SRC/$1 ~/$2
}

function main(){

    # /config 
    link config/bash/bashrc .bashrc
    link config/bash/bash_aliases .bash_aliases
    link config/bspwm/bspwmrc .config/bspwm/.
    link config/git/gitconfig .gitconfig
    link config/flashfocus/flashfocus.yml .config/flashfocus/.
    link config/lf/lfrc .config/lf/.
    link config/polybar/ .config/polybar/.
    link config/profile .profile
    link config/sxhkd/sxhkdrc .config/sxhkd/.
    link config/vim/vimrc .vimrc
    link config/Xresources .Xresources
    link config/zsh/zshrc .zshrc
    link config/zsh/zsh_custom_plugins/git .oh-my-zsh/custom/plugins/.
    link config/zsh/zsh_custom_plugins/git-flow-completion .oh-my-zsh/custom/plugins/.

    # /scripts 
    link scripts/tdrop  .local/bin/.
    for f in $(ls scripts/clipmenu/*); do link $f .local/bin/.; done

}

main 
