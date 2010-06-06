#!/bin/bash
## A bash script to get search results from isohunt, and download the torrent.
## TODO: add section to specify download folder. perhaps a config.rc?

## Variable setup
file="/tmp/isodump"
format="$HOME/.scripts/isosearch/formatting.sed"

## Check dependency
if [ ! `which w3m` ];then
     echo "Please install w3m."
     exit
fi

## Process arguments
if [ ! "$1" ]; then
        echo "enter search term: "
        read tempterm             
        term=$(echo $tempterm | tr '[:blank:]' '\053')
else                                                  
for i in $@;do                                        
    case "$i" in                                        
          "-p")                                       
               showres="y"                            
               ;;                                     
      "--help")                                       
               echo -e "A simple script to get torrent results from isohunt.\n"
               echo -e "USAGE: \tsearch [QUERY] [OPTIONS] .."                  
               echo -e "\tQuery may be blank for interactive usage,"           
               echo -e "\tbut must be in quotes otherwise."
               echo -e "\t-h  --help : print this message."                                   
               echo -e "\t-p         : print first 5 results automatically."          
               exit                                                            
              ;;                                                               
       "-h")                                       
               echo -e "A simple script to get torrent results from isohunt.\n"
               echo -e "USAGE: \tsearch [QUERY] [OPTIONS] .."                  
               echo -e "\tQuery may be blank for interactive usage,"           
               echo -e "\tbut must be in quotes otherwise."
               echo -e "\t-h  --help : print this message."
               echo -e "\t-p         : print first 5 results automatically."          
               exit                                                            
              ;;
            *)                                                                
               term=$(echo "$i" | tr '[:blank:]' '\053')                         
               ;;                                                              
    esac
done                                                                           
fi

## Get search results and print number of results
w3m -no-cookie -dump "http://isohunt.com/js/json.php?rows=40&sort=seeds&ihq="$term | tr '},{' '\n' > $file
echo -e "\n"
awk '/total_results/{print "Total Results: "$2}' "$file"

## Output results
if [ "$showres" = "" ]; then
	echo -e "\nThe following will print the first 5 results ordered by Seeders."
	echo -e "Type \"a\" to print the first 20 results."
	echo -e "\nPrint results? y/N/a : "
	read showres
fi
if [ "$showres" = "y" ]; then
	sed -i -f $format $file -e '/guid/d'
	cat -n $file | head -n 30
elif [ "$showres" = "a" ]; then
	sed -i -f $format $file -e '/guid/d'
	cat -n $file
elif [ "$showres" = "n" ]; then
	rm /tmp/isodump
	exit
else
	rm /tmp/isodump
	exit
fi

## Find out which torrent to download
echo -e "\nThis will download to ~/torrents/"
echo -e "Enter number to download, hit return to quit: "
read line >/dev/null

if [ "$line" = "" ]; then
	rm /tmp/isodump
	exit
else
	url="`sed -n $line\p $file | awk {'print $2'}`"
	echo "Downloading "$url
fi

## Get it.
wget -nv -nc -U Mozilla/4.0 -P $HOME/torrents/ $url
echo -e "\nTorrents in folder:"
ls $HOME/torrents/*.torrent
rm /tmp/isodump
