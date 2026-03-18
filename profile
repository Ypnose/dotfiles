# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- ENVIRONMENT -------------------------------------------------------
umask 077
TMPDIR="${XDG_RUNTIME_DIR:?}/tmp"
RANDFILE="${TMPDIR:?}/rnd"

# -- *PATH -------------------------------------------------------------
[[ -d ${HOME}/.local/bin ]] && PATH="${PATH}:${HOME}/.local/bin"
[[ -d ${HOME}/.local/ybin ]] && PATH="${PATH}:${HOME}/.local/ybin"
CDPATH=".:${HOME}"

# -- EDITOR ------------------------------------------------------------
EDITOR=vi
VISUAL="$EDITOR"
EXINIT='ai 0:hlp 1:ic 1:ts 4'

# -- LESS --------------------------------------------------------------
PAGER=less
LESS="-KLRx4"
LESSHISTFILE="-"

# -- XDG ---------------------------------------------------------------
XDG_CACHE_HOME="${XDG_RUNTIME_DIR:?}/cache"
XDG_CONFIG_HOME="${HOME}/.config"

# -- EXPORT ------------------------------------------------------------
export TMPDIR RANDFILE PATH CDPATH EDITOR VISUAL EXINIT PAGER \
	LESS LESSHISTFILE XDG_CACHE_HOME XDG_CONFIG_HOME

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE
mkdir -p "$TMPDIR"
rm -rf "${HOME:?}/.pki" "${HOME:?}/Desktop"
