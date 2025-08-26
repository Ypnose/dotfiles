# .bashrc

[[ $- != *i* ]] && return

# -- OPTIONS -----------------------------------------------------------
shopt -s cdspell
shopt -s expand_aliases
unset HISTFILE

# -- PROMPT ------------------------------------------------------------
# SSH_CONNECTION works with dropbear unlike SSH_CLIENT
PS1='${SSH_CONNECTION:+[\[\033[1;31m\]REMOTE\[\033[0m\]]}[\u@\h:\[\033[0;34m\]\w\[\033[0m\]]\$ '

# -- ALIASES -----------------------------------------------------------
alias ls='ls -Fh --color=auto'
alias grep='grep --color=auto'
