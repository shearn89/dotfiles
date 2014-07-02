#!/bin/sh
xrdb ~/.Xresources

sh ~/.fehbg &
conky &
exec i3
