# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- ENVIRONMENT -------------------------------------------------------
umask 077

# -- *PATH -------------------------------------------------------------
[[ -d ${HOME}/.local/bin ]] && PATH="${PATH}:${HOME}/.local/bin"
[[ -d ${HOME}/.local/ybin ]] && PATH="${PATH}:${HOME}/.local/ybin"
CDPATH=".:${HOME}"

# -- EDITOR ------------------------------------------------------------
EDITOR=vi
VISUAL="$EDITOR"

# -- LESS --------------------------------------------------------------
PAGER=less
LESS="-KLRx4"
LESSHISTFILE="-"

# -- XDG ---------------------------------------------------------------
XDG_CACHE_HOME="/run/user/$(id -u)/tmp"
XDG_CONFIG_HOME="${HOME}/.config"

# -- EXPORT ------------------------------------------------------------
export PATH CDPATH MANPATH EDITOR VISUAL PAGER LESS LESSHISTFILE \
	XDG_CACHE_HOME XDG_CONFIG_HOME

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE

# -- NOFUDIRS ----------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
