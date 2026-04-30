#!/bin/bash

mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo ~/.vim/plugged

# rm -f ~/.bashrc
rm -f ~/.bashprompt
rm -f ~/.bash_aliases
rm -f ~/.dircolors
rm -f ~/.gitconfig
rm -f ~/.screenrc
rm -f ~/.vimrc

PWD=`pwd`
echo $PWD

# ln -s $PWD/bashrc ~/.bashrc
ln -s $PWD/bashprompt ~/.bashprompt
ln -s $PWD/bash_aliases ~/.bash_aliases
ln -s $PWD/dircolors ~/.dircolors
ln -s $PWD/gitconfig ~/.gitconfig
ln -s $PWD/screenrc ~/.screenrc
ln -s $PWD/vimrc ~/.vimrc

source ~/.bashrc
