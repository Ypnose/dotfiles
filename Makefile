# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = aliases nexrc mkshrc profile tmux.conf
OPTFILE = Xresources gitconfig

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

diff:
	@sh diff-files | yiff

newbox: clean base ssh bin scripts gpg fonts conf

rescue: clean base ssh gpg

####################

base: mini
	for o in ${OPTFILE}; \
		do test -f ${DESTDIR}/.$${o} || cp $${o} ${DESTDIR}/.$${o}; \
	done

bin:
	mkdir -p ${DESTDIR}/.yusr/bin
	cp bin/scrup ${DESTDIR}/.yusr/bin
	chmod +x ${DESTDIR}/.yusr/bin/scrup

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .inputrc .lesshst .login .logout .rnd .xsession \
		.xsession-errors

conf:
	mkdir -p ${DESTDIR}/.config
	cp misc/xdg/user-dirs.dirs ${DESTDIR}/.config
	mkdir -p ${DESTDIR}/.config/xkb/rules
	cp xkb/evdev ${DESTDIR}/.config/xkb/rules
	mkdir -p ${DESTDIR}/.config/xkb/symbols
	cp xkb/kbyp ${DESTDIR}/.config/xkb/symbols
	mkdir -p ${DESTDIR}/.yusr/etc
	cp misc/mozilla/firefox_prefs.js ${DESTDIR}/.yusr/etc
	cp misc/wpa_supplicant/wpa-example.conf ${DESTDIR}/.yusr/etc

fonts:
	mkdir -p ${DESTDIR}/.config/fontconfig
	cp misc/fonts/fonts.conf ${DESTDIR}/.config/fontconfig
	mkdir -p ${DESTDIR}/.config/gtk-3.0
	test -f ${DESTDIR}/.config/gtk-3.0/settings.ini || cp misc/fonts/settings.ini ${DESTDIR}/.config/gtk-3.0
	test -f ${DESTDIR}/.gtkrc-2.0 || cp misc/fonts/gtkrc-2.0 ${DESTDIR}/.gtkrc-2.0
	mkdir -p ${DESTDIR}/.fonts/bitmaps
	cp misc/fonts/*.*tf ${DESTDIR}/.fonts
	cp misc/fonts/*.pcf.gz ${DESTDIR}/.fonts/bitmaps
	test -f ${DESTDIR}/.fonts/bitmaps/fonts.dir || cp misc/fonts/fonts.dir ${DESTDIR}/.fonts/bitmaps

gpg:
	mkdir -p ${DESTDIR}/.gnupg
	chmod 700 ${DESTDIR}/.gnupg
	test -f ${DESTDIR}/.gnupg/gpg.conf || cp gpg/gpg.conf ${DESTDIR}/.gnupg
	test -f ${DESTDIR}/.gnupg/gpg-agent.conf || cp gpg/gpg-agent.conf ${DESTDIR}/.gnupg
	find ${DESTDIR}/.gnupg -type f -exec chmod 600 {} +
	chmod 400 ${DESTDIR}/.gnupg/gpg.conf ${DESTDIR}/.gnupg/gpg-agent.conf

mini:
	for f in ${REQFILE}; do cp "$${f}" "${DESTDIR}/.$${f}"; done

scripts:
	curl -o ${DESTDIR}/rypp https://framagit.org/Ypnose/rypp/raw/master/rypp
	curl -o ${DESTDIR}/yss https://framagit.org/Ypnose/yss/raw/master/yss
	chmod +x ${DESTDIR}/rypp ${DESTDIR}/yss

ssh:
	mkdir -p ${DESTDIR}/.ssh
	chmod 700 ${DESTDIR}/.ssh
	test -f ${DESTDIR}/.ssh/config || cp ssh/config ${DESTDIR}/.ssh
	chmod 600 ${DESTDIR}/.ssh/config
	! test -f ${DESTDIR}/.ssh/authorized_keys || chmod 600 ${DESTDIR}/.ssh/authorized_keys

svn:
	mkdir -p ${DESTDIR}/.subversion
	chmod 700 ${DESTDIR}/.subversion
	cp misc/svn/servers ${DESTDIR}/.subversion
	chmod 644 ${DESTDIR}/.subversion/servers

wayland:
	mkdir -p ${DESTDIR}/.config/sway
	cp gui/swayconfig ${DESTDIR}/.config/sway/config
	mkdir -p ${DESTDIR}/.config/foot
	cp gui/foot.ini ${DESTDIR}/.config/foot
	mkdir -p ${DESTDIR}/.config/imv
	cp gui/imvconfig ${DESTDIR}/.config/imv/config
	mkdir -p ${DESTDIR}/.config/mpv
	cp gui/mpv.conf ${DESTDIR}/.config/mpv
	cp gui/mpvinput.conf ${DESTDIR}/.config/mpv/input.conf

xorg:
	mkdir -p ${DESTDIR}/.config/i3
	cp gui/i3config ${DESTDIR}/.config/i3/config
	test -f ${DESTDIR}/.xinitrc || cp xinitrc ${DESTDIR}/.xinitrc

.PHONY: all list diff newbox rescue base bin clean conf fonts gpg mini scripts ssh svn wayland xorg
