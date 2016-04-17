# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- RYPP --------------------------------------------------------------
RYPP_DEST="/opt/rypp"
RYPP_REPO="http://files.ywstd.fr/p/rypp"

# -- *PATH -------------------------------------------------------------
[[ -d ${RYPP_DEST}/bin ]] && PATH="${RYPP_DEST}/bin:${PATH}"
[[ -d ${HOME}/.yusr/bin ]] && PATH="${PATH}:${HOME}/.yusr/bin"
CDPATH="${HOME}:${CDPATH}"
MANPATH=":${RYPP_DEST}/man"

# -- ENVIRONMENT -------------------------------------------------------
# EDITOR
if [[ -x $(whence -p jupp) ]]; then
	EDITOR=jupp
else
	EDITOR=vi
fi
VISUAL="$EDITOR"

# {N,M}AILRC
if [[ -r ${HOME}/.yusr/conf/nailrc ]]; then
	MAILRC="${HOME}/.yusr/conf/nailrc"
elif [[ -r ${HOME}/.yusr/conf/mailrc ]]; then
	MAILRC="${HOME}/.yusr/conf/mailrc"
fi

# LESS
PAGER=less
LESS="-KR"
LESSHISTFILE="-"

# -- EXPORT ------------------------------------------------------------
export RYPP_DEST RYPP_REPO RYPP_PUBK PATH CDPATH MANPATH \
	EDITOR VISUAL MAILRC PAGER LESS LESSHISTFILE

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE

# -- NOFUDIRS ----------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
[[ -d ${HOME}/.config/git ]] && rm -r "${HOME}/.config/git"
