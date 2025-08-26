# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- ENVIRONMENT -------------------------------------------------------
umask 077

# -- *PATH -------------------------------------------------------------
[[ -d ${HOME}/.local/bin ]] && PATH="${PATH}:${HOME}/.local/bin"
[[ -d ${HOME}/.yusr/bin ]] && PATH="${PATH}:${HOME}/.yusr/bin"
CDPATH=".:${HOME}"

# -- EDITOR ------------------------------------------------------------
EDITOR=vi
VISUAL="$EDITOR"

# -- LESS --------------------------------------------------------------
PAGER=less
LESS="-KLRx4"
LESSHISTFILE="-"

# -- XDG ---------------------------------------------------------------
XDG_CACHE_HOME="/tmp"

# -- EXPORT ------------------------------------------------------------
export PATH CDPATH MANPATH EDITOR VISUAL PAGER LESS LESSHISTFILE \
	XDG_CACHE_HOME

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE

# -- NOFUDIRS ----------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
