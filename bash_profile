# -------------------------------------------------------------------+
# file:     .bash_profile                                            +
# author:   Ypnose - http://ywstd.fr                                 +
# -------------------------------------------------------------------+

# -- BASHRC ----------------------------------------------------------
[[ -f $HOME/.bashrc ]] && . "$HOME/.bashrc"

# -- ENVIRONMENT -----------------------------------------------------
# LESS
if [[ -n $(command -v less) ]]; then
	PAGER=less
	LESS="-R"
	LESSHISTFILE="-"
	export PAGER LESS LESSHISTFILE
fi

# -- EXPORT ----------------------------------------------------------

# -- FUFILES ---------------------------------------------------------
[[ -f $HOME/.viminfo ]] && rm "$HOME/.viminfo"