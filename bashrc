# .bashrc

# Source global definitions
test -f /etc/bashrc && . /etc/bashrc

set -o ignoreeof

export EDITOR=vim
export PATH=/usr/local/bin:~/bin:$PATH

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

if [ -d /etc/init.d ]; then
  complete -W "$(ls -1 /etc/init.d)" service
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

test -f ~/.bash_aliases && . ~/.bash_aliases

test -f ~/.bashprompt && . ~/.bashprompt

# User functions
# tarfold will tar and gzip a full directory by name, appending the date
function tarfold {
  directory=`echo "$1" | sed 's/\/\+$//'`;
  tarname=$directory.`date '+%Y%m%d-%H%M --utc'`.tar.gz
  tar -cvzf $tarname $directory;
  echo "$directory tar'd and gzip'd to $tarname"
};

# run bash_local last in case it has to overwrite
test -f ~/.bash_local &&. ~/.bash_local
