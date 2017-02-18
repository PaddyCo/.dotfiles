#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "\e[95mSymlinking dot files~! <3\e[39m"

# Zsh
mkdir ~/.oh-my-zsh/themes -p
ln $DIR/lain.zsh-theme ~/.oh-my-zsh/themes/lain.zsh-theme
ln $DIR/.zshrc ~/.zshrc -s
echo -e "\e[92mzsh configured!\e[39m"

# Tmux
ln $DIR/.tmux.conf ~/.tmux.conf
echo -e "\e[92mtmux configured!\e[39m"

# Nvim
mkdir ~/.config/nvim/ -p
ln $DIR/.vimrc ~/.config/nvim/init.vim -s
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim-plug installed!"
echo -e "\e[92mneovim configured!\e[39m"
