# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = aliases nexrc mkshrc profile
OPTFILE = Xresources

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

diff:
	@sh diff-files | yiff

newbox: clean base gpg ssh conf fonts

####################

base:
	for f in ${REQFILE}; \
		do install -m 0600 -p "$${f}" "${DESTDIR}/.$${f}"; \
	done
	install -D -m 0600 -p misc/tmuxconf ${DESTDIR}/.config/tmux/tmux.conf
	for o in ${OPTFILE}; \
		do test -f ${DESTDIR}/.$${o} \
			|| install -m 0600 -p $${o} ${DESTDIR}/.$${o}; \
	done
	find ${DESTDIR} -type d -exec chmod 0700 {} +

bin:
	install -D -m 0700 -p bin/scrup ${DESTDIR}/.yusr/bin/scrup
	find ${DESTDIR}/.yusr/ -type d -exec chmod 0700 {} +

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .inputrc .lesshst .login .logout .rnd .xsession \
		.xsession-errors

conf:
	install -D -m 0600 -p misc/user-dirs.dirs \
		${DESTDIR}/.config/user-dirs.dirs
	install -D -m 0600 -p misc/gitconfig ${DESTDIR}/.config/git/config
	install -D -m 0600 -p xkb/evdev ${DESTDIR}/.config/xkb/rules/evdev
	install -D -m 0600 -p xkb/kbyp ${DESTDIR}/.config/xkb/symbols/kbyp
	mkdir -p ${DESTDIR}/.yusr/etc/
	find ${DESTDIR}/.config/ ${DESTDIR}/.yusr/ -type d \
		-exec chmod 0700 {} +

fonts:
	install -D -m 0600 -p misc/fonts/fonts.conf \
		${DESTDIR}/.config/fontconfig/fonts.conf
	test -f ${DESTDIR}/.config/gtk-3.0/settings.ini \
		|| install -D -m 0600 -p misc/fonts/settings.ini \
			${DESTDIR}/.config/gtk-3.0/settings.ini
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
		|| install -p misc/sshconfig ${DESTDIR}/.ssh/config
	chmod 0600 ${DESTDIR}/.ssh/config
	! test -f ${DESTDIR}/.ssh/authorized_keys \
		|| chmod 0600 ${DESTDIR}/.ssh/authorized_keys

wayland:
	install -D -m 0600 -p gui/swayconfig ${DESTDIR}/.config/sway/config
	install -D -m 0600 -p gui/foot.ini ${DESTDIR}/.config/foot/foot.ini
	install -D -m 0600 -p gui/imvconfig ${DESTDIR}/.config/imv/config
	install -D -m 0600 -p gui/mpv.conf ${DESTDIR}/.config/mpv/mpv.conf
	install -m 0600 -p gui/mpvinput.conf ${DESTDIR}/.config/mpv/input.conf
	find ${DESTDIR}/.config/ -type d -exec chmod 0700 {} +

xorg:
	install -D -m 0600 -p gui/i3config ${DESTDIR}/.config/i3/config
	install -D -m 0600 -p xkb/yp.xkb ${DESTDIR}/.config/xkb/yp.xkb
	find ${DESTDIR}/.config/ -type d -exec chmod 0700 {} +
	test -f ${DESTDIR}/.gtkrc-2.0 \
		|| install -m 0600 -p misc/fonts/gtkrc-2.0 ${DESTDIR}/.gtkrc-2.0
	install -m 0600 -p xinitrc ${DESTDIR}/.xinitrc

.PHONY: all list diff newbox base bin clean conf fonts gpg ssh wayland \
	xorg
