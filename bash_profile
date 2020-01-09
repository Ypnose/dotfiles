# ---------------------------------------------------------------------+
# file:     .bash_profile                                              +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

# -- BASHRC ------------------------------------------------------------
[[ -f ${HOME}/.bashrc ]] && . "${HOME}/.bashrc"

# -- ENVIRONMENT -------------------------------------------------------
# LESS
if [[ -x $(command -v less) ]]; then
	PAGER=less
	LESS="-R"
	LESSHISTFILE="-"
	export PAGER LESS LESSHISTFILE
fi

# -- EXPORT ------------------------------------------------------------

# -- FUFILES -----------------------------------------------------------
unalias rm
rm -f "${HOME}/.bash_history" "${HOME}/.viminfo"
