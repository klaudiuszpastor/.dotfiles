#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
#VBoxClient-all &
polybar & 
#xrandr --newmode "2560x1440_165.00"  941.49  2560 2792 3080 3600  1440 1441 1444 1585  -HSync +Vsync
#xrandr --addmode Virtual1 "2560x1440_165.00"
#xrandr --output Virtual1 --mode "2560x1440_165.00" 
feh --bg-fill /home/claudius/wallpapers/fuji-mount.jpg
wal -n -i /home/claudius/wallpapers/fuji.jpg
picom &
exec dwm

