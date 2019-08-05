#!/bin/sh

CLS=$1
CMD=$2

# if no instance of the app has been started, launch one now
if [ -z "`wmctrl -lx | grep $CLS`" ]; then
$CMD &
else
# search for existing app on any desktop and move it to the current desktop
app_on_any_desk=`wmctrl -lx | grep $CLS | cut -d ' ' -f 1`
wmctrl -i -a $app_on_any_desk
fi;
