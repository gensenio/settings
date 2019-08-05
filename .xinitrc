xrdb -load .Xresources 

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CURRENT_DESKTOP=XFCE
QT_STYLE_OVERIDE=GTK+


#mlterm -j genuine -@ 0 --maxptys=2
urxvtd -f -o -q
compton -b --experimental-backends
dbus-launch dunst &
exec ck-launch-session dbus-launch icewm-session
