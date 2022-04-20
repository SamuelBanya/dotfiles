# Taken from here:
# https://bbs.archlinux.org/viewtopic.php?id=167077
# Force xrdb to use 'merge' for ~/.Xresources:
userresources=$HOME/.Xresources

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

xmodmap ~/.xmodmap

# The black/white grid as background doesn't suit my taste.
xsetroot -solid black &

# Start 'ratpoison' window manager
exec /usr/bin/ratpoison
