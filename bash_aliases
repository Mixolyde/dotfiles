# aliases I like almost everywhere
alias x=exit
alias sdr='screen -D -R'
alias slist='screen -list'
alias du1='du -h --max-depth=1 |sort -h'

# editing
alias vi='nvim'
alias vim='nvim'
alias edit='nvim'

# reload bash scripts
alias sbash='. ~/.bashrc'

# some ls aliases
alias ls='ls --color=auto -F'
alias ll='ls -hal'
alias la='ls -A'
alias lt='ls -ltra'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# stats
alias ports='netstat -tulanp'
alias meminfo='free -mlt'
alias psmem='ps aux | sort -n -k 4'

# development aliases
alias depdate='date "+%Y%m%d_%H%M%S" --utc'
alias dotfiles='cd ~/projects/dotfiles'
alias g='git'

# bashrc stuff to not overwrite system default bashrc
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
