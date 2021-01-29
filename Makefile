.PHONY deps link 

DOTFILES := $(shell pwd)
 
## parts: link, clean, deps, bspwm, alacritty, zsh, bash, polybar, 


polybar:

clean:

link:
		@ln -sfn $(DOTFILES)/config/bash/bashrc $(HOME)/.

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
deps:

