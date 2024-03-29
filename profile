# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- ENVIRONMENT -------------------------------------------------------
umask 077

# -- RYPP --------------------------------------------------------------
RYPP_DEST="/opt/rypp"
RYPP_REPO="http://ywstd.fr/repo"

# -- *PATH -------------------------------------------------------------
[[ -d ${RYPP_DEST}/bin ]] && PATH="${RYPP_DEST}/bin:${PATH}"
[[ -d ${HOME}/.yusr/bin ]] && PATH="${PATH}:${HOME}/.yusr/bin"
[[ -d ${HOME}/.local/bin ]] && PATH="${PATH}:${HOME}/.local/bin"
CDPATH=".:${HOME}"
MANPATH=":${RYPP_DEST}/man"

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
export RYPP_DEST RYPP_REPO PATH CDPATH MANPATH \
	EDITOR VISUAL PAGER LESS LESSHISTFILE XDG_CACHE_HOME

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE

# -- NOFUDIRS ----------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
