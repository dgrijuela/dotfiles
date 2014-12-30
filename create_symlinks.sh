#!/bin/bash

# This script creates symlinks from the home directory to my
# desired dotfiles which are in ~/dotfiles

dir=~/dotfiles                    # absolute paths
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc gitconfig gitignore"     # list of files/folders to symlink in ~
theme=dgrijuela.zsh-theme         # custom theme
plugin=dgrijuela.plugin.zsh       # custom plugin

echo "Creating $olddir to backup any existing dotfiles in ~"
mkdir -p $olddir

echo "Moving conflicting dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done

echo "Cloning vundle inside vim to install vim plugins and then installing them"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Installing vim plugin YouCompleteMe"
if [ "$(uname)" == "Linux" ]; then
  sudo apt-get -y install python-dev cmake
elif [ "$(uname)" == "Darwin" ]; then
  brew install cmake python
  echo "if vim doesn't work, brew unlink python"
fi
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

echo "Installing zsh and making it the default shell"
if [ "$(uname)" == "Linux" ]; then
  sudo apt-get -y install zsh # mac comes with it
fi
chsh -s $(which zsh)

echo "Cloning oh-my-zsh to make zsh even more awesome"
git clone http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Creating symlinks for my custom theme and plugin for oh-my-zsh"
ln -s $dir/oh-my-zsh/custom/$theme ~/.oh-my-zsh/custom/$theme
mkdir ~/.oh-my-zsh/custom/plugins/dgrijuela
ln -s $dir/oh-my-zsh/custom/plugins/dgrijuela/$plugin ~/.oh-my-zsh/custom/plugins/dgrijuela/$plugin
