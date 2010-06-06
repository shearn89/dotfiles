#!/bin/bash
# A script to check gmail, and use awesomeWM's
# message function to alert me. Hack away.

gmail_login="doyouthinkimstupid"  
gmail_password="lolcatftw"

foo="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
	https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
	--no-check-certificate | grep 'fullcount' \
	| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"

if [ -z "$foo" ]; then
echo "`cat /home/shearn89/.scripts/gmailsave` new"
else
echo $dane > /home/shearn89/.scripts/gmailsave
echo "$dane new"
if [ "$dane" != "0" ]; then
echo "awesome-message -x 490 -y 350 -d 3 " you got gmail " /home/shearn89/.icons/snowish/22x22/apps/email.png"
fi
fi
