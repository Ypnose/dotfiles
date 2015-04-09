# Makefile
# Ypnose - http://ywstd.fr

DEST = dest
DFILE = jupprc \
	mkshrc \
	profile \
	tmux.conf
HFILE = Xresources \
	aliases \
	xinitrc

all: list

list:
	@echo "options: list bash bsd clean def geany git moc ssh svn work"

bash:
	@cp bashrc ${DEST}/.bashrc
	@cp bash_profile ${DEST}/.bash_profile
	@ln -s ${DEST}/.bash_profile ${DEST}/.profile

bsd:
	@cp kshrc ${DEST}/.kshrc

clean:
	@cd ${DEST} && rm -f .bash_history .bash_logout .bash_profile \
		.inputrc .lesshst .login .logout .rnd .xsession .xsession-errors

def:
	@for f in ${DFILE}; do \
		cp "$${f}" "${DEST}/.$${f}"; \
	done

geany:
	@mkdir -p ${DEST}/.config/geany/colorschemes
	@cp geany/ycolor.conf ${DEST}/.config/geany/colorschemes

git:
	@cp gitconfig ${DEST}/.gitconfig

moc:
	@mkdir -p ${DEST}/.moc/themes
	@cp moc/config ${DEST}/.moc
	@cp moc/bluedream ${DEST}/.moc/themes

ssh:
	@mkdir -pm 700 ${DEST}/.ssh
	@cp ssh/config ${DEST}/.ssh
	@chmod 644 ${DEST}/.ssh/config

svn:
	@mkdir -pm 700 ${DEST}/.subversion
	@cp svn/servers ${DEST}/.subversion
	@chmod 644 ${DEST}/.subversion/servers

work:
	@cp cwmrc ${DEST}/.cwmrc
	@cp work/Xdefaults ${DEST}/.Xdefaults
	@cp work/aliases ${DEST}/.aliases
	@cp work/xinitrc ${DEST}/.xinitrc

.PHONY: all list bash bsd clean def geany git moc ssh svn work
