# -------------------------------------------------------------------+
# file:     .profile                                                 +
# author:   Ypnose - http://ywstd.fr                                 +
# -------------------------------------------------------------------+

# -- VARIABLES -------------------------------------------------------
if [[ -x $(whence -p jupp) ]]; then
	EDITOR=jupp
else
	EDITOR=vi
fi
VISUAL=$EDITOR

# -- MAIL ------------------------------------------------------------
if [[ -r ${HOME}/.yusr/conf/nailrc ]]; then
	MAILRC="${HOME}/.yusr/conf/nailrc"
elif [[ -r ${HOME}/.yusr/conf/mailrc ]]; then
	MAILRC="${HOME}/.yusr/conf/mailrc"
fi

# -- *PATH -----------------------------------------------------------
[[ -d ${HOME}/.yusr/bin ]] && PATH="${PATH}:${HOME}/.yusr/bin"
CDPATH="${HOME}:${CDPATH}"

# -- ENVIRONMENT -----------------------------------------------------
# LESS
PAGER=less
LESS="-KR"
LESSHISTFILE="-"

# -- EXPORT ----------------------------------------------------------
export EDITOR VISUAL MAILRC PATH CDPATH PAGER LESS LESSHISTFILE

# -- NOFUDIRS --------------------------------------------------------
[[ -d ${HOME}/Desktop ]] && rm -r "${HOME}/Desktop"
[[ -d ${HOME}/.config/git ]] && rm -r "${HOME}/.config/git"
