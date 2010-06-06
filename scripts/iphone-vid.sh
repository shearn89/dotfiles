#!/bin/bash
#ffmpeg -i "$1" -r 29.97 -vcodec h264 -s 480x320 -aspect 16:9 -flags +loop -cmp +chroma -deblockalpha 0 \
#-deblockbeta 0 -b 1000k -maxrate 1250k -bufsize 4M -bt 256k -refs 1 -coder 0 -me hex -me_range 16 -subq 5\
# -partitions +parti4x4+parti8x8+partp8x8 -g 250 -keyint_min 25 -level 30 -qmin 10 -qmax 51 -qcomp 0.6 -tre\
# llis 2 -sc_threshold 40 -i_qfactor 0.71 -acodec aac -ab 80k -ar 48000 -ac 2 "$2"

ffmpeg -i "$1" input -acodec aac -ab 128kb -vcodec mpeg4 -b 1200kb -mbd 2 -flags +4mv+trell -aic 2 -cmp 2 -subcmp 2 -s 320x180 -title X "$2"
