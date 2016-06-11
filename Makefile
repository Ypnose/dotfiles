# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = jupprc mkshrc profile terminfo.cdb tmux.conf

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

newbox: clean base ssh rypp fonts xkb

####################

base:
	for f in ${REQFILE}; do cp "$${f}" "${DESTDIR}/.$${f}"; done

bash:
	cp bashrc ${DESTDIR}/.bashrc
	cp bash_profile ${DESTDIR}/.bash_profile
	ln -s ${DESTDIR}/.bash_profile ${DESTDIR}/.profile

bsd:
	cp kshrc ${DESTDIR}/.kshrc

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .inputrc .lesshst .login .logout .rnd .xsession \
		.xsession-errors

fonts:
	mkdir -p ${DESTDIR}/.config/fontconfig
	cp misc/fonts/fonts.conf ${DESTDIR}/.config/fontconfig

rypp:
	curl -o ${DESTDIR}/rypp https://git.framasoft.org/Ypnose/rypp/raw/master/rypp
	chmod +x ${DESTDIR}/rypp

ssh:
	mkdir -pm 700 ${DESTDIR}/.ssh
	cp ssh/config ${DESTDIR}/.ssh
	chmod 644 ${DESTDIR}/.ssh/config

svn:
	mkdir -pm 700 ${DESTDIR}/.subversion
	cp misc/svn/servers ${DESTDIR}/.subversion
	chmod 644 ${DESTDIR}/.subversion/servers

# Needs tweaking
work: svn
	cp cwmrc ${DESTDIR}/.cwmrc
	cp work/Xdefaults ${DESTDIR}/.Xdefaults
	cp work/aliases ${DESTDIR}/.aliases
	cp work/xinitrc ${DESTDIR}/.xinitrc

xkb:
	mkdir -p ${DESTDIR}/.yusr
	cp -r xkb/ ${DESTDIR}/.yusr

.PHONY: all list newbox base bash bsd clean fonts rypp ssh svn work xkb
