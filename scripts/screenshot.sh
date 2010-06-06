#!/bin/bash

if [ ! `which import` ];then
     echo "Please install imagemagick."
     exit
fi

datetime=$(date '+%F-%H:%M:%S-%N')
import -window root ~/screenshots/$datetime.png

