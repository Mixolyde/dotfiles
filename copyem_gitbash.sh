#!/bin/bash

rm -f ~/.bashrc ~/.bashprompt ~/.dircolors ~/.bash_aliases ~/.screenrc ~/.vimrc
# ~/.gitconfig 

PWD=`pwd`
echo $PWD

cp -f $PWD/bashrc ~/.bashrc
cp -f $PWD/bash_aliases ~/.bash_aliases
cp -f $PWD/dircolors ~/.dircolors
#cp -f $PWD/gitconfig ~/.gitconfig
cp -f $PWD/screenrc ~/.screenrc
cp -f $PWD/vimrc ~/.vimrc

source ~/.bashrc
