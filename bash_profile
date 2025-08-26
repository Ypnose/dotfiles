# .bash_profile

# -- BASHRC ------------------------------------------------------------
[[ -f ${HOME}/.bashrc ]] && . "${HOME}/.bashrc"

# -- ENVIRONMENT -------------------------------------------------------
umask 077

# LESS
if [[ -x $(command -v less) ]]; then
	PAGER=less
	LESS="-R"
	LESSHISTFILE="-"
	export PAGER LESS LESSHISTFILE
fi

# -- EXPORT ------------------------------------------------------------

# -- FUFILES -----------------------------------------------------------
unalias rm 2>/dev/null
rm -f "${HOME}/.bash_history" "${HOME}/.viminfo"
