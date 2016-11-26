# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = jupprc mkshrc profile terminfo.cdb tmux.conf
OPTFILE = aliases cwmrc gitconfig xinitrc Xresources

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

diff:
	@sh check-changes -v | yiff

newbox: clean base ssh bin rypp fonts conf

####################

base:
	for f in ${REQFILE}; do cp "$${f}" "${DESTDIR}/.$${f}"; done
	for o in ${OPTFILE}; \
		do test -f ${DESTDIR}/.$${o} || cp $${o} ${DESTDIR}/.$${o}; \
	done

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

conf:
	mkdir -p ${DESTDIR}/.config
	cp misc/xdg/user-dirs.dirs ${DESTDIR}/.config
	mkdir -p ${DESTDIR}/.yusr/conf
	cp -r xkb/ ${DESTDIR}/.yusr
	cp misc/firefox/prefs.js ${DESTDIR}/.yusr/conf
	cp misc/wpa_supplicant/wpa-example.conf ${DESTDIR}/.yusr/conf

fonts:
	mkdir -p ${DESTDIR}/.config/fontconfig
	cp misc/fonts/fonts.conf ${DESTDIR}/.config/fontconfig
	mkdir -p ${DESTDIR}/.fonts/bitmaps
	cp misc/fonts/*.ttf ${DESTDIR}/.fonts
	cp misc/fonts/*.pcf.gz ${DESTDIR}/.fonts/bitmaps

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

.PHONY: all list diff newbox base bash bin bsd clean conf fonts rypp ssh svn
