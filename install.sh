#!/usr/bin/env bash
#
# Installs dotfiles
#
#############################

function main(){
    install_packages;
    install_plugins;
    setup;
}

function install_packages(){
    apt install neovim python-neovim python3-neovim tmux -y
}
function install_plugins(){
    # Installs zsh, vim and plugin
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null 2>&1
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions > /dev/null 2>&1
    git clone https://github.com/zdharma/fast-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting > /dev/null 2>&1
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf > /dev/null 2>&1
    ~/.fzf/install > /dev/null 2>&1

    mkdir -p ~/bin
    curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
    chmod +x ~/bin/tldr

}

function setup(){
    echo "symlink"
    export PATH="$PATH:~/bin"
    #ln -sfnv ~/.dotfiles/.vimrc .vimrc
    #ln -sfnv ~/.dotfiles/.zshrc .zshrc
}


main "$@"
