#!/bin/bash
# from http://www.unix.com/shell-programming-scripting/96238-random-colour-xterm-alias.html

n=10 ## adjust to taste: higher value, lighter background
n1=$(( 256 - $n ))
R=$(( $RANDOM % $n1 + $n ))
G=$(( $RANDOM % $n1 + $n ))
B=$(( $RANDOM % $n1 + $n ))
X=.299
Y=.587
Z=.114
Bri=$( echo "scale=0;(1 - $X * $R + $Y * $G + $Z * $B) / 1" | bc )

#echo $Bri
if [ $Bri -gt 60 ] 
then
    Fg="black"
else
    Fg="white"
fi
    


#bg=$( printf "#%x%x%x\n" $(( $RANDOM % $n1 + $n )) \
    #$(( $RANDOM % $n1 + $n )) \
    #$(( $RANDOM % $n1 + $n )) )
bg=$( printf "rgba:%x00/%x00/%x00/ff00\n" $R \
	     $G \
	     $B )

# xterm/aterm/whatever/etc as you like
#xterm -bg "$bg" &
#xterm -fg black -bg "$bg" -bd "$bg" &
if [ $# -eq 0 ]
then
    urxvtc -fg "$Fg" -bg "$bg" &
else
    if [ $1 -eq "-e"]
    then
	urxvtc -fg "$Fg" -bg "$bg" -e $2 $3&
    else
	urxvtc -fg "$Fg" -bg "$bg" -e $1 $2&
    fi
fi
