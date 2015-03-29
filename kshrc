# -------------------------------------------------------------------+
# file:     .kshrc (OpenBSD)                                         +
# author:   Ypnose - http://ywstd.fr                                 +
# -------------------------------------------------------------------+

# -- PS1 -------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
	PS1='[\e[0;31mREMOTBSD\e[0m] \e[0;36m\h\e[0m > \e[1;32m\w\e[0m \$ '
else
	PS1='\e[0;36m\h\e[0m > \e[1;32m\w\e[0m \$ '
fi

# -- BINDINGS --------------------------------------------------------
bind -m '^L'=clear'^J'

# -- ALIASES ---------------------------------------------------------
alias ls='ls -F'
alias repf='sudo pfctl -nf /etc/pf.conf && sudo pfctl -f /etc/pf.conf'
alias brute='clear && tail -40 /var/log/authlog'
alias ressh='sudo kill -HUP $(</var/run/sshd.pid)'
