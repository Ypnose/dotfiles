# ---------------------------------------------------------------------+
# file:     .xinitrc                                                   +
# author:   Ypnose - http://ywstd.fr                                   +
# ---------------------------------------------------------------------+

xset +fp "${HOME}/.fonts/bitmaps"
xset fp rehash
xrdb -merge "${HOME}/.Xresources"
xset s off dpms 300 300 0
xsetroot -solid "#4C584C"
#xautolock -secure -time 5 -locker slock &
kymap
#exec cwm
