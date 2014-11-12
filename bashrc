# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

set -o ignoreeof

export EDITOR=vim
export PATH=/usr/local/bin:~/bin:$PATH

export JAVA_HOME=/usr/lib/jvm/java-1.7.0

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

eval "$(dircolors -b ~/.dircolors)"

# tab-completion in shell
alias service='sudo /sbin/service'
complete -W "$(ls -1 /etc/init.d)" service

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bashprompt ]; then
  . ~/.bashprompt
fi

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

# User functions
# tarfold will tar and gzip a full directory by name, appending the date
function tarfold {
  directory=`echo "$1" | sed 's/\/\+$//'`;
  tarname=$directory.`date '+%Y%m%d-%H%M --utc'`.tar.gz
  tar -cvzf $tarname $directory;
  echo "$directory tar'd and gzip'd to $tarname"
};
