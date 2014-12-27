#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc gitconfig"     # list of files/folders to symlink in homedir
theme=dgrijuela.zsh-theme         # custom theme
plugin=dgrijuela.plugin.zsh       # custom plugin

# Create dotfiles_old folder in home
echo -n "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# Move conflicting dotfiles to dotfiles_old and create symlinks
for file in $files; do
    echo "Moving any conflicting dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

# Making vim able to install vundle plugins and installing them
echo "Cloning vundle to install vim plugins and installing them"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Installing zsh, making it the default shell, and downloading oh-my-zsh
echo "Installing zsh and making it the default shell"
sudo apt-get -y install zsh
chsh -s $(which zsh)
echo "Cloning oh-my-zsh to make zsh even more awesome"
git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Make symlinks for custom oh-my-zsh theme and plugin
echo "Creating symlinks for my custom theme and plugin for oh-my-zsh"
ln -s $dir/oh-my-zsh/custom/$theme ~/.oh-my-zsh/custom/$theme
mkdir ~/.oh-my-zsh/custom/plugins/dgrijuela
ln -s $dir/oh-my-zsh/custom/plugins/dgrijuela/$plugin ~/.oh-my-zsh/custom/plugins/dgrijuela/$plugin
