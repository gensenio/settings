xrdb -load .Xresources 


dbus-update-activation-environment --systemd DISPLAY

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID


export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CURRENT_DESKTOP=XFCE
QT_STYLE_OVERIDE=GTK+


#mlterm -j genuine -@ 0 --maxptys=2
urxvtd -f -o -q
compton -b --experimental-backends
dbus-launch dunst &
exec ck-launch-session dbus-launch icewm-session
