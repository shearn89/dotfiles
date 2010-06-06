#!/bin/bash
# A very simple script, using cronjobs
# to set the wakeup time.
# Symlink this script to /usr/local/bin
# for ease of use.
#
# example crontab, remove the leading hash.
# This wakes me at 10 on weekends, 9 otw:
# 0 10 * * 0,6 alarmclock
# 0 9 * * 1-5 alarmclock

mpc clear
mpc load wakeup
mpc play 1
mpc random on
