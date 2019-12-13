#!/usr/bin/bash
#
# links all dotfiles
#


SRC="dotfiles/dotfiles"

function link(){
    # $1 file
    ln -sfv ~/$SRC/$1 ~/$1
}

function git_debs(){
    # $1 dir
    # $2 repo

    ls ~/$1 > /dev/null || git clone $2 ~/.
}

link .gitconfig
link .zshrc
link .vimrc
link .bashrc

#git_debs ohmyzsh https://github.com/ohmyzsh/ohmyzsh.git
#git_debs powerlevel10k https://github.com/romkatv/powerlevel10k.git
#gits autojump https://github.com/wting/autojump.git
