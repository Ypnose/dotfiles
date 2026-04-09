# ---------------------------------------------------------------------+
# file:     .profile                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- ENVIRONMENT -------------------------------------------------------
umask 077
TMPDIR="${XDG_RUNTIME_DIR:?}/tmp"
RANDFILE="${TMPDIR:?}/rnd"

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

# -- *PATH -------------------------------------------------------------
[[ -d ${HOME}/.local/bin ]] && PATH="${PATH}:${HOME}/.local/bin"
[[ -d ${HOME}/.local/ybin ]] && PATH="${PATH}:${HOME}/.local/ybin"
CDPATH=".:${HOME}"

# -- EXPORT ------------------------------------------------------------
export TMPDIR RANDFILE EDITOR VISUAL EXINIT PAGER LESS LESSHISTFILE \
	XDG_CACHE_HOME XDG_CONFIG_HOME PATH CDPATH

# -- VARIOUS -----------------------------------------------------------
unset HISTFILE
mkdir -p "$TMPDIR"
rm -rf \
	"${HOME:?}/.pki" \
	"${HOME:?}/.serverauth."* \
	"${HOME:?}/Desktop"
