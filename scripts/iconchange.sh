#!/bin/bash
# A script for lightweight WMs to change 
# the gtk icon theme, no other tools needed.
# Icon themes must be folders in ~/.icons or /usr/share/icons

CHOSEN=$(grep -i gtk-icon-theme-name ~/.gtkrc.mine | cut -d "=" -f 2 | sed 's/^ *//' | tr -d "\"")
old=$CHOSEN

echo "Current theme: "$old
echo -e "\nAvailable themes: "
ls --color=auto $HOME/.icons
ls --color=auto /usr/share/icons

echo -ne "\nchoose your theme: "
read -e CHOSEN
if [ ! "$CHOSEN" ]; then
	CHOSEN=$old
	echo "No input detected, keeping old theme."
fi
mv ~/.gtkrc.mine ~/.gtkrc.old
grep -vi gtk-icon-theme-name ~/.gtkrc.old > ~/.gtkrc.mine
echo "gtk-icon-theme-name = "\"$CHOSEN\""" >> ~/.gtkrc.mine
echo "New theme file:"
cat ~/.gtkrc.mine
