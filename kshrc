# -------------------------------------------------------------------+
# file:     .kshrc (OpenBSD)                                         +
# author:   Ypnose - http://ywstd.fr                                 +
# -------------------------------------------------------------------+

# -- PS1 -------------------------------------------------------------
PS1='\e[0;31m\h\e[0m >> \e[1;32m\w\e[0m \$ '

# -- BINDINGS --------------------------------------------------------
bind -m '^L'=clear'^J'

# -- ALIASES ---------------------------------------------------------
alias repf='sudo pfctl -nf /etc/pfctl.conf && sudo pfctl -Fall -f /etc/pfctl.conf'
alias brute='clear && tail -40 /var/log/authlog'
alias ressh='sudo kill -HUP $(</var/run/sshd.pid)'
