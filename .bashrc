[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
export TERM=xterm-256color

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias cp='cp -R'

# some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias lm='ll | more'

# Feeds file and directory filtered listers:
function lister {
    ls -l `if [ "$1" == '' ]; then echo '.'; else echo "$1"; fi`
}
# List only directories:
function lsd {
    lister "$1" | egrep '^d'
}
# More memorable version:
alias lsdirs=lsd
# List only files:
function lsf {
    lister "$1" | egrep -v '^d'
}
# More memorable version:
alias lsfiles=lsf

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias h='history'
alias cp='cp -r'
alias delpyc='find ./ -type f -name "*.pyc" -exec rm -f {} \;'
alias vi='vim'

alias smtp='python -m smtpd -n -c DebuggingServer localhost:1025'
alias tunnel_dorian='ssh -L 8001:172.16.17.252:8001 ubuntu@localhost -p 7922'
alias tunnel_cerc='ssh -L 8000:127.0.0.1:8000 dtamez@localhost -p 9922'
alias cercular='ssh -l dtamez localhost -p 9922'

alias ap1='ssh apu-app-001'
alias web1='ssh apu-web-001'
alias db1='ssh apu-db-001'
alias wk1='ssh apu-wrk-001'
alias wk2='ssh apu-wrk-002'

alias r_ap1='ssh root@ap-app-01'
alias r_web1='ssh root@ap-web-01'
alias r_db1='ssh root@ap-db-01'
alias r_wk1='ssh root@ap-wrk-01'
alias r_wk2='ssh root@ap-wrk-02'

alias tm='~/tm'
alias tm-ui='~/tm-ui'
unset HISTFILESIZE
HISTSIZE=100000
PROMPT_COMMAND="history -a"
export HISTSIZE PROMPT_COMMAND

shopt -s histappend
export DEBFULLNAME='Danny Tamez'
export DEBEMAIL='zematynnad@gmail.com'
alias dbuild='dpkg-buildpackage -S -rfakeroot -k96FC9875'

alias gist='gist -c'
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
set -o vi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
