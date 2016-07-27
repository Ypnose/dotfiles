# ---------------------------------------------------------------------+
# file:     .kshrc (OpenBSD)                                           +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- PS1 ---------------------------------------------------------------
if [[ -n $SSH_CONNECTION ]]; then
	PS1='[\e[1;31mREMOTEBSD\e[0m] \h \e[1;32m\w\e[0m \$ '
else
	PS1='\h > \e[1;32m\w\e[0m \$ '
fi

# -- BINDINGS ----------------------------------------------------------
bind -m '^L'=clear'^J'

# -- ALIASES -----------------------------------------------------------
alias ls='ls -Fh'
alias pflog='doas tcpdump -n -e -ttt -r /var/log/pflog'
alias repf='doas pfctl -nf /etc/pf.conf && doas pfctl -f /etc/pf.conf'
alias ressh='doas kill -HUP $(</var/run/sshd.pid)'
