xset +fp /usr/share/fonts/local
xset fp rehash
xbindkeys
synclient TouchpadOff=1
feh --bg-center Downloads/grayocean.jpg
dropboxd &
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
exec i3 -V >> ~/.i3/i3log 2>&1
#exec  ~/bin/startdwm
