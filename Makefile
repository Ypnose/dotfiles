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

newbox: clean base gpg ssh conf fonts bin

####################

base:
	for f in ${REQFILE}; \
		do install -m 0600 -p "$${f}" "${DESTDIR}/.$${f}"; \
	done
	for o in ${OPTFILE}; \
		do test -f ${DESTDIR}/.$${o} \
			|| install -m 0600 -p $${o} ${DESTDIR}/.$${o}; \
	done

bin:
	mkdir -p ${DESTDIR}/.yusr/bin/
	install -m 0700 -p bin/scrup ${DESTDIR}/.yusr/bin/
	find ${DESTDIR}/.yusr/ -type d -exec chmod 0700 {} +

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .inputrc .lesshst .login .logout .rnd .xsession \
		.xsession-errors

conf:
	mkdir -p ${DESTDIR}/.config/
	install -m 0600 -p misc/xdg/user-dirs.dirs ${DESTDIR}/.config/
	mkdir -p ${DESTDIR}/.config/xkb/rules/
	install -m 0600 -p xkb/evdev ${DESTDIR}/.config/xkb/rules/
	mkdir -p ${DESTDIR}/.config/xkb/symbols/
	install -m 0600 -p xkb/kbyp ${DESTDIR}/.config/xkb/symbols/
	mkdir -p ${DESTDIR}/.yusr/etc/
	find ${DESTDIR}/.config/ ${DESTDIR}/.yusr/ -type d \
		-exec chmod 0700 {} +

fonts:
	mkdir -p ${DESTDIR}/.config/fontconfig/
	install -m 0600 -p misc/fonts/fonts.conf ${DESTDIR}/.config/fontconfig/
	mkdir -p ${DESTDIR}/.config/gtk-3.0/
	test -f ${DESTDIR}/.config/gtk-3.0/settings.ini \
		|| install -m 0600 -p misc/fonts/settings.ini ${DESTDIR}/.config/gtk-3.0/
	test -f ${DESTDIR}/.gtkrc-2.0 \
		|| install -m 0600 -p misc/fonts/gtkrc-2.0 ${DESTDIR}/.gtkrc-2.0
	mkdir -p ${DESTDIR}/.local/share/fonts/bitmaps/
	install -m 0600 -p misc/fonts/*.*tf ${DESTDIR}/.local/share/fonts/
	install -m 0600 -p misc/fonts/*.pcf.gz ${DESTDIR}/.local/share/fonts/bitmaps/
	test -f ${DESTDIR}/.local/share/fonts/bitmaps/fonts.dir \
		|| install -m 0600 -p misc/fonts/fonts.dir \
			${DESTDIR}/.local/share/fonts/bitmaps/
	find ${DESTDIR}/.config/ ${DESTDIR}/.local/share/ -type d \
		-exec chmod 0700 {} +

gpg:
	mkdir -p ${DESTDIR}/.gnupg/
	test -f ${DESTDIR}/.gnupg/gpg.conf \
		|| install -m 0400 -p gpg/gpg.conf ${DESTDIR}/.gnupg/
	test -f ${DESTDIR}/.gnupg/gpg-agent.conf \
		|| install -m 0400 -p gpg/gpg-agent.conf ${DESTDIR}/.gnupg/
	find ${DESTDIR}/.gnupg/ -type d -exec chmod 0700 {} +
	find ${DESTDIR}/.gnupg/ -type f -exec chmod 0600 {} +
	chmod 0400 ${DESTDIR}/.gnupg/gpg.conf ${DESTDIR}/.gnupg/gpg-agent.conf

ssh:
	install -m 0700 -d ${DESTDIR}/.ssh/
	test -f ${DESTDIR}/.ssh/config \
		|| install -p ssh/config ${DESTDIR}/.ssh/
	chmod 0600 ${DESTDIR}/.ssh/config
	! test -f ${DESTDIR}/.ssh/authorized_keys \
		|| chmod 0600 ${DESTDIR}/.ssh/authorized_keys

wayland:
	mkdir -p ${DESTDIR}/.config/sway/
	install -m 0600 -p gui/swayconfig ${DESTDIR}/.config/sway/config
	mkdir -p ${DESTDIR}/.config/foot/
	install -m 0600 -p gui/foot.ini ${DESTDIR}/.config/foot/
	mkdir -p ${DESTDIR}/.config/imv/
	install -m 0600 -p gui/imvconfig ${DESTDIR}/.config/imv/config
	mkdir -p ${DESTDIR}/.config/mpv/
	install -m 0600 -p gui/mpv.conf ${DESTDIR}/.config/mpv/
	install -m 0600 -p gui/mpvinput.conf ${DESTDIR}/.config/mpv/input.conf
	find ${DESTDIR}/.config/ -type d -exec chmod 0700 {} +

xorg:
	mkdir -p ${DESTDIR}/.config/i3/
	install -m 0600 -p gui/i3config ${DESTDIR}/.config/i3/config
	find ${DESTDIR}/.config/ -type d -exec chmod 0700 {} +
	test -f ${DESTDIR}/.xinitrc || cp xinitrc ${DESTDIR}/.xinitrc

.PHONY: all list diff newbox base bin clean conf fonts gpg ssh wayland \
	xorg
