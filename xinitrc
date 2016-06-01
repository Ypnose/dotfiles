# ---------------------------------------------------------------------+
# file:     .xinitrc                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

xrdb -merge "${HOME}/.Xresources"

xset +fp "/usr/share/fonts/artwiz-fonts"
xset +fp "${HOME}/.fonts/bitmaps"
xset fp rehash

urxvtd -q -o -f

xset s off dpms 900 900 0
xsetroot -solid "#303E4B"
xsetroot -cursor_name left_ptr

kymap

exec dwmstart
