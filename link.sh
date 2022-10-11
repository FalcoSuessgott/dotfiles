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
	
	# alacritty
	link config/alacritty/alacritty.yml .config/alacritty/.
	link scripts/spawn-alacritty-cwd .local/bin/.

	# bash
	link config/bash/bashrc .bashrc
	link config/bash/bash_aliases .bash_aliases
	link config/bash/bash_profile .bash_profile

	# bspwm
	link config/bspwm/bspwmrc .config/bspwm/.
	
	# ulauncher
	link config/ulauncher/user-themes/ReMatch-Dark-Blue-Ulauncher .config/ulauncher/user-themes/.

	# mkcert
	link config/mkcert .mkcert
	# git
    	link config/git/gitconfig .gitconfig

    	# polybar	
	link config/polybar/ .config/.

	# link config/profile .profile

	# sxhkd
	link config/sxhkd/sxhkdrc .config/sxhkd/.

	# link config/vim/vimrc .vimrc
	# link config/Xresources .Xresources

	# terraform
	link config/terraform/.tfenv .

	# golang
	link config/go/.gvm .

	# zsh
	link config/zsh/zshrc .zshrc
	link config/zsh/zsh_custom_plugins/git .oh-my-zsh/custom/plugins/.
	link config/zsh/zsh_custom_plugins/git-flow-completion .oh-my-zsh/custom/plugins/.
	link config/zsh/zsh_custom_plugins/zsh-autosuggestions .oh-my-zsh/custom/plugins/.
}

main 
