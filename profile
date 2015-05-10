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
	#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:.
	PKG_PATH="http://ftp.fr.openbsd.org/pub/OpenBSD/snapshots/amd64/"
	export PKG_PATH
fi
[[ -d $HOME/.yusr/bin ]] && PATH="$PATH:$HOME/.yusr/bin"
CDPATH="$HOME:$CDPATH"

# -- EXPORT ----------------------------------------------------------
export EDITOR VISUAL TERMINAL MAILRC PATH CDPATH

# -- ENVIRONMENT -----------------------------------------------------
# GREP
# Bright cyan
GREP_COLOR='1;36'
# GNU grep deprecated it
#GREP_OPTIONS='--binary-files=without-match -d skip'

# Default browser
BROWSER=firefox

# LESS
PAGER=less
LESS="-R"
LESSHISTFILE="-"
LESS_TERMCAP_mb=$'\E[01;31m'		# begin blinking
LESS_TERMCAP_md=$'\E[01;38;5;74m'	# begin bold
LESS_TERMCAP_me=$'\E[0m'			# end mode
LESS_TERMCAP_se=$'\E[0m'			# end standout-mode
LESS_TERMCAP_so=$'\E[0;44;30m'		# begin standout-mode - info box
LESS_TERMCAP_ue=$'\E[0m'			# end underline
LESS_TERMCAP_us=$'\E[04;38;5;146m'	# begin underline

# -- EXPORT ----------------------------------------------------------
export GREP_COLOR BROWSER PAGER \
	LESS LESSHISTFILE LESS_TERMCAP_mb LESS_TERMCAP_md LESS_TERMCAP_me \
	LESS_TERMCAP_se LESS_TERMCAP_so LESS_TERMCAP_ue LESS_TERMCAP_us

# -- NOFUDIRS --------------------------------------------------------
[[ -d $HOME/Desktop ]] && rm -r "$HOME/Desktop"
[[ -d $HOME/.config/git ]] && rm -r "$HOME/.config/git"
