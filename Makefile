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

newbox: clean base ssh conf fonts

####################

base:
	for f in ${REQFILE}; \
		do install -m 0600 -p "$${f}" "${DESTDIR}/.$${f}"; \
	done
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
		.bashrc .gtkrc-2.0 .inputrc .lesshst .login .logout .rnd \
		.tig_history .xsession .xsession-errors

conf:
	install -D -m 0600 -p xkb/evdev ${DESTDIR}/.config/xkb/rules/evdev
	install -D -m 0600 -p xkb/kbyp ${DESTDIR}/.config/xkb/symbols/kbyp
	mkdir -p ${DESTDIR}/.local/share/tig/ ${DESTDIR}/.yusr/etc/
	find ${DESTDIR}/.config/ ${DESTDIR}/.local/ ${DESTDIR}/.yusr/ \
		-type d -exec chmod 0700 {} +

fonts:
	mkdir -p ${DESTDIR}/.local/share/fonts/bitmaps/
	install -m 0600 -p misc/fonts/*.*tf ${DESTDIR}/.local/share/fonts/
	install -m 0600 -p misc/fonts/*.pcf.gz ${DESTDIR}/.local/share/fonts/bitmaps/
	test -f ${DESTDIR}/.local/share/fonts/bitmaps/fonts.dir \
		|| install -m 0600 -p misc/fonts/fonts.dir \
			${DESTDIR}/.local/share/fonts/bitmaps/
	find ${DESTDIR}/.config/ ${DESTDIR}/.local/share/ -type d \
		-exec chmod 0700 {} +

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
