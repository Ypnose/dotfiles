# ---------------------------------------------------------------------+
# file:     .bashrc                                                    +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

[[ $- != *i* ]] && return

# -- OPTIONS -----------------------------------------------------------
shopt -s cdspell
shopt -s expand_aliases
unset HISTFILE

# -- PROMPT ------------------------------------------------------------
# SSH_CONNECTION works with dropbear unlike SSH_CLIENT
if [[ -n $SSH_CONNECTION ]]; then
	PS1='[\[\033[1;31m\]REMOTE\[\033[0m\]] [\u@\h \[\033[0;32m\]\w\[\033[0m\]]\$ '
else
	PS1='[\u@\h \[\033[0;32m\]\w\[\033[0m\]]\$ '
fi

# -- ALIASES -----------------------------------------------------------
alias ls='ls -F --color=auto'
alias grep='grep --color=auto'
