# -------------------------------------------------------------------+
# file:     .profile                                                 +
# author:   Ypnose - http://ywstd.fr                                 +
# -------------------------------------------------------------------+

# -- VARIABLES -------------------------------------------------------
if [[ -n $(whence -p jupp) ]]; then
	EDITOR=jupp
else
	EDITOR=vi
fi
VISUAL=$EDITOR
if [[ -n $(whence -p urxvt) ]]; then
	TERMINAL=urxvt
else
	TERMINAL=uxterm
fi

# -- MAIL ------------------------------------------------------------
if [[ -r $HOME/.yusr/conf/nailrc ]]; then
	MAILRC="$HOME/.yusr/conf/nailrc"
elif [[ -r $HOME/.yusr/conf/mailrc ]]; then
	MAILRC="$HOME/.yusr/conf/mailrc"
fi

# -- *PATH -----------------------------------------------------------
if [[ $(uname -s) = "OpenBSD" ]]; then
	PKG_PATH="http://ftp.fr.openbsd.org/pub/OpenBSD/snapshots/amd64/"
	export PKG_PATH
fi
[[ -d $HOME/.yusr/bin ]] && PATH="$PATH:$HOME/.yusr/bin"
CDPATH="$HOME:$CDPATH"

# -- EXPORT ----------------------------------------------------------
export EDITOR VISUAL TERMINAL MAILRC PATH CDPATH

# -- ENVIRONMENT -----------------------------------------------------
# GREP
GREP_COLOR='1;36'

# Default browser
BROWSER=firefox

# LESS
PAGER=less
LESS="-R"
LESSHISTFILE="-"

# -- EXPORT ----------------------------------------------------------
export GREP_COLOR BROWSER PAGER LESS LESSHISTFILE

# -- NOFUDIRS --------------------------------------------------------
[[ -d $HOME/Desktop ]] && rm -r "$HOME/Desktop"
[[ -d $HOME/.config/git ]] && rm -r "$HOME/.config/git"
