#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Symlinking dot files~! <3"

# Zsh
mkdir -p ~/.oh-my-zsh/themes
ln -s $DIR/lain.zsh-theme ~/.oh-my-zsh/themes/lain.zsh-theme
ln -s $DIR/.zshrc ~/.zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "zsh configured!"

# Tmux
mkdir -p ~/.tmux
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.tmux/* ~/.tmux/
echo "tmux configured!"

# Nvim
mkdir -p ~/.config/nvim/
ln -s $DIR/.vimrc ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim-plug installed!"
echo "neovim configured!"
