# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- RYPP --------------------------------------------------------------
RYPP_DEST="/opt/rypp"
RYPP_REPO="http://ywstd.fr/repo"

# -- *PATH -------------------------------------------------------------
[[ -d ${RYPP_DEST}/bin ]] && PATH="${RYPP_DEST}/bin:${PATH}"
[[ -d ${HOME}/.yusr/bin ]] && PATH="${PATH}:${HOME}/.yusr/bin"
CDPATH=".:${HOME}"
MANPATH=":${RYPP_DEST}/man"

# -- ENVIRONMENT -------------------------------------------------------
umask 077

# EDITOR
EDITOR=vi
VISUAL="$EDITOR"

# {N,M}AILRC
if [[ -r ${HOME}/.yusr/etc/nailrc ]]; then
	MAILRC="${HOME}/.yusr/etc/nailrc"
elif [[ -r ${HOME}/.yusr/etc/mailrc ]]; then
	MAILRC="${HOME}/.yusr/etc/mailrc"
fi

# LESS
PAGER=less
LESS="-KRx4"
LESSHISTFILE="-"

# XDG
XDG_CACHE_HOME="/tmp"

# -- EXPORT ------------------------------------------------------------
export RYPP_DEST RYPP_REPO PATH CDPATH MANPATH \
	EDITOR VISUAL MAILRC PAGER LESS LESSHISTFILE XDG_CACHE_HOME

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE

# -- NOFUDIRS ----------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
[[ -d ${HOME}/.config/git ]] && rm -r "${HOME}/.config/git"
