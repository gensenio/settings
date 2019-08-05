#!/bin/bash

case $1 in
up)
    mixer_option='3%+';;
down)
    mixer_option='3%-';;
toggle)
    mixer_option='toggle';;
*)
    exit 1;;
esac
# set new volume status
amixer set Master,0 $mixer_option > /dev/null
# get volume information
volume_percent=$(amixer get Master,0 | awk '/Mono:/ {print $4}' | tr -d 
'[]')
volume_mute=$(amixer get Master,0 | awk '/Mono:/ {print $6}')
if [[ $volume_mute == '[off]' ]];then
volume_mute='[Mute]'
else
volume_mute=''
fi
# osd_cat configuration
osd_pid='/tmp/osd-volume.pid'
osd_cmd='osd_cat --font=-*-fixed-bold-r-*-*-18-*-*-*-*-*-*-* --shadow=1 
--color=#1E90FF \
  --pos=bottom --offset=30 --align=center --lines=2 --delay=5 
--barmode=percentage'
# print the osd bar, killing previous if still running
if [[ -f $osd_pid ]]; then kill $(cat $osd_pid) 2> /dev/null; fi
($osd_cmd --percentage=$volume_percent --text="Master 
Volume:$volume_percent $volume_mute") &
echo $! > $osd_pid
