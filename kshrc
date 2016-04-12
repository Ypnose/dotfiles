# ---------------------------------------------------------------------+
# file:     .kshrc (OpenBSD)                                           +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- PS1 ---------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
	PS1='[\e[0;31mREMOTBSD\e[0m] \e[0;36m\h\e[0m > \e[1;32m\w\e[0m \$ '
else
	PS1='\e[0;36m\h\e[0m > \e[1;32m\w\e[0m \$ '
fi

# -- BINDINGS ----------------------------------------------------------
bind -m '^L'=clear'^J'

# -- ALIASES -----------------------------------------------------------
alias ls='ls -F'
alias repf='doas pfctl -nf /etc/pf.conf && doas pfctl -f /etc/pf.conf'
alias brute='clear && tail -40 /var/log/authlog'
alias ressh='doas kill -HUP $(</var/run/sshd.pid)'
