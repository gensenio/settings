#!/bin/sh
 
# osd_cat options
POS=bottom # top, middle or bottom
ALIGN=center # left, center or right
OFFSET=0 # offset from the top or bottom
COLOR=yellow # white, blue, yellow, cyan, magenta, green, etc
SHADOW=2 # offset of shadow, 0 for none
DELAY=3 # seconds to show the OSD
AGE=0 # seems broken :\
BARMODE=slider # percentage or slider
FONT=-*-helvetica-medium-r-*-*-*-320-*-*-*-*-*-*

BRI=$(cat /sys/class/backlight/acpi_video0/brightness)
PERCENT=$BRI/15
killall osd_cat >/dev/null 2>&1 # if the -a switch worked, we wouldn't need this

osd_cat -p $POS -c $COLOR -s $SHADOW -a $AGE -d $DELAY -o $OFFSET -A $ALIGN -b $BARMODE -P $PERCENT -f $FONT -l 1 -T "Volume: $BRI"

