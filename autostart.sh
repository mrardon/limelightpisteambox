#!/bin/bash

#PC Info
MAC="<ENTER MAC HERE e.g. 12:34:56:78:90:12>"
HOSTNAME="<ENTER IP OR HOSTNAME OF PC HERE>"

#Start PC
wakeonlan $MAC

#Wait until steam is reachable
echo Connecting to the PC ($HOSTNAME)...
while ! nc -z -w5 $HOSTNAME 47989 &>/dev/null; do :; done

#Start limelight
echo PC available at $HOSTNAME, starting limelight
cd /home/pi/limelight
java -jar limelight.jar -mapping xbox.map -60fps stream $HOSTNAME
