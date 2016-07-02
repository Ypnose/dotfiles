# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = aliases jupprc mkshrc profile terminfo.cdb tmux.conf

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

newbox: clean base ssh bin rypp fonts xkb

####################

base:
	for f in ${REQFILE}; do cp "$${f}" "${DESTDIR}/.$${f}"; done

bash:
	cp bashrc ${DESTDIR}/.bashrc
	cp bash_profile ${DESTDIR}/.bash_profile
	ln -s ${DESTDIR}/.bash_profile ${DESTDIR}/.profile

bin:
	mkdir -p ${DESTDIR}/.yusr/bin
	cp bin/scrup ${DESTDIR}/.yusr/bin
	chmod +x ${DESTDIR}/.yusr/bin/scrup

bsd:
	cp kshrc ${DESTDIR}/.kshrc

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .inputrc .lesshst .login .logout .rnd .xsession \
		.xsession-errors

fonts:
	mkdir -p ${DESTDIR}/.config/fontconfig
	cp misc/fonts/fonts.conf ${DESTDIR}/.config/fontconfig
	mkdir -p ${DESTDIR}/.fonts
	cp misc/fonts/*.ttf ${DESTDIR}/.fonts

rypp:
	curl -o ${DESTDIR}/rypp https://git.framasoft.org/Ypnose/rypp/raw/master/rypp
	chmod +x ${DESTDIR}/rypp

ssh:
	mkdir -p ${DESTDIR}/.ssh
	chmod 700 ${DESTDIR}/.ssh
	test -f ${DESTDIR}/.ssh/config || cp ssh/config ${DESTDIR}/.ssh
	chmod 644 ${DESTDIR}/.ssh/config

svn:
	mkdir -p ${DESTDIR}/.subversion
	chmod 700 ${DESTDIR}/.subversion
	cp misc/svn/servers ${DESTDIR}/.subversion
	chmod 644 ${DESTDIR}/.subversion/servers

# Needs tweaking
work: svn
	cp cwmrc ${DESTDIR}/.cwmrc
	cp work/Xdefaults ${DESTDIR}/.Xdefaults
	cp work/xinitrc ${DESTDIR}/.xinitrc

xkb:
	mkdir -p ${DESTDIR}/.yusr
	cp -r xkb/ ${DESTDIR}/.yusr

.PHONY: all list newbox base bash bin bsd clean fonts rypp ssh svn work xkb
