# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
if [ "$(uname)" = 'Darwin' ] || [ "$(uname)" = 'FreeBSD' ]; then
	alias ls='ls -FG'
else
	alias ls='ls --color=auto -FG'
fi
alias la='ls -la'
alias ll='ls -l'
alias vi='vim'
