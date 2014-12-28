#!/bin/bash

# This script creates symlinks from the home directory to my
# desired dotfiles which are in ~/dotfiles

# Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc gitconfig"     # list of files/folders to symlink in ~
theme=dgrijuela.zsh-theme         # custom theme
plugin=dgrijuela.plugin.zsh       # custom plugin

echo -n "Creating $olddir to backup any existing dotfiles in ~"
mkdir -p $olddir

for file in $files; do
    echo "Moving any conflicting dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

echo "Cloning vundle inside vim to install vim plugins and then installing them"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "This is for the plugin YouCompleteMe"
if [ "$(uname)" == "Linux" ];, then
  sudo apt-get -y install python-dev cmake
elif [ "$(uname)" == "Darwin" ]; then
  brew install python # macvim, hope it works without it
fi
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

echo "Installing zsh and making it the default shell"
sudo apt-get -y install zsh
chsh -s $(which zsh)
echo "Cloning oh-my-zsh to make zsh even more awesome"
git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Creating symlinks for my custom theme and plugin for oh-my-zsh"
ln -s $dir/oh-my-zsh/custom/$theme ~/.oh-my-zsh/custom/$theme
mkdir ~/.oh-my-zsh/custom/plugins/dgrijuela
ln -s $dir/oh-my-zsh/custom/plugins/dgrijuela/$plugin ~/.oh-my-zsh/custom/plugins/dgrijuela/$plugin
