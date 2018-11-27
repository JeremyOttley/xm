#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

xrandr --output VGA-1 --mode 1920x1080

[ -f "$HOME/.Xresources" ] && xrdb -merge "$HOME/.Xresources"
[ -f ~/.xprofile ] && . ~/.xprofile

rm -rf "$HOME/.cache/"
rm -rf "$HOME/.thumbnails"
rm -rf "$HOME/.local/share/Trash"

xhost +SI:localuser:$USER

export _JAVA_AWT_WM_NONREPARENTING=1

xsetroot -cursor_name left_ptr

xset r rate 200 60

xmodmap -e 'clear Lock' #ensures you're not stuck in CAPS on mode
xmodmap -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC

export VISUAL=emacsclient
export EDITOR="$VISUAL"
export TERM="st"
export DISPLAY=:0

xfce4-power-manager &
xscreensaver -no-splash &
nm-applet &                     # Network Manager
pulseaudio --kill               # Kill pulseaudio
pulseaudio --start              # Start pulseaudio
volti &                         # Volume manager
udiskie --no-notify --tray &    # Disk mount utility

emacs --daemon -f exwm-enable
exec emacsclient -c
#exec emacs -fs --eval "(exwm-enable)"
