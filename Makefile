# Makefile
# Ypnose - http://ywstd.fr

DESTDIR ?= dest
REQFILE = aliases mkshrc profile

####################

all: list

list:
	@echo "Targets:"
	@awk -F':' '!/(all|list)/&&/^[a-z]+:/{printf(" * %s\n", $$1);next}' Makefile

diff:
	@sh diff-files | yiff

newbox: clean base ssh conf fonts

####################

base:
	for f in ${REQFILE}; \
		do install -m 0600 -p "$${f}" "${DESTDIR}/.$${f}"; \
	done
	install -m 0700 -d ${DESTDIR}/.config/yetc/
	install -m 0600 -p Xresources ${DESTDIR}/.config/yetc/
	find ${DESTDIR} -type d -exec chmod 0700 {} +

bin:
	install -D -m 0700 -p bin/scrup ${DESTDIR}/.local/ybin/scrup
	find ${DESTDIR}/.local/ -type d -exec chmod 0700 {} +

clean:
	cd ${DESTDIR} && rm -f .bash_history .bash_logout .bash_profile \
		.bashrc .gtkrc-2.0 .inputrc .lesshst .login .logout .pki .rnd \
		.tig_history .xsession .xsession-errors

conf:
	install -D -m 0600 -p xkb/evdev ${DESTDIR}/.config/xkb/rules/evdev
	install -D -m 0600 -p xkb/kbyp ${DESTDIR}/.config/xkb/symbols/kbyp
	mkdir -p ${DESTDIR}/.config/yetc/ ${DESTDIR}/.local/share/tig/
	find ${DESTDIR}/.config/ ${DESTDIR}/.local/ \
		-type d -exec chmod 0700 {} +

fonts:
	install -m 0700 -d ${DESTDIR}/.local/share/fonts/
	install -m 0600 -p misc/fonts/*.*tf ${DESTDIR}/.local/share/fonts/
	find ${DESTDIR}/.local/share/ -type d -exec chmod 0700 {} +

ssh:
	install -m 0700 -d ${DESTDIR}/.ssh/
	test -f ${DESTDIR}/.ssh/config \
		|| install -p misc/sshconfig ${DESTDIR}/.ssh/config
	chmod 0600 ${DESTDIR}/.ssh/config
	! test -f ${DESTDIR}/.ssh/authorized_keys \
		|| chmod 0600 ${DESTDIR}/.ssh/authorized_keys

xorg:
	install -D -m 0600 -p xkb/yp.xkb ${DESTDIR}/.config/xkb/yp.xkb
	find ${DESTDIR}/.config/ -type d -exec chmod 0700 {} +

.PHONY: all list diff newbox base bin clean conf fonts ssh xorg
