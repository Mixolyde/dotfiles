# aliases I like almost everywhere
alias x=exit
alias sdr='screen -D -R'
alias slist='screen -list'
alias du1='du -h --max-depth=1 |sort -rh'

# editing
alias vi='vim'
alias edit='vim'

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
alias dotfiles='cd ~/repos/dotfiles'
alias g='git'
alias gs='git status'
alias gcm='git commit -a -m '
alias gpom='git push origin master'

