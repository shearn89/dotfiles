export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="afowler"
export EDITOR="$HOME/bin/mate_wait"
export OPENCCG_HOME=/Users/shearn89/Coding/openccg
export TEXEDIT='mate -w -l %d "%s%'
export CLASSPATH=$CLASSPATH:/Users/shearn89/Coding/inf4/adbs/attica/build

plugins=(git osx ruby rails textmate)

source $ZSH/oh-my-zsh.sh
setopt no_correctall

# Customize to your needs...
export JENAROOT=/Users/shearn89/Coding/apache-jena-2.7.0-incubating

export PATH=$OPENCCG_HOME/bin:/Users/shearn89/bin:/usr/local/texlive/2010/bin/universal-darwin/:/usr/local/Cellar/ruby/1.9.2-p290/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:~/.cabal/bin:/Users/shearn89/Coding/android-sdk-macosx/tools:/Users/shearn89/Coding/android-sdk-macosx/platform-tools:$JENAROOT/bin

[[ -s "/Users/shearn89/.rvm/scripts/rvm" ]] && source "/Users/shearn89/.rvm/scripts/rvm"

alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgrep='ps aux | grep '
alias kenken_stitch='convert ~/Desktop/kenken-1.png ~/Desktop/kenken-2.png ~/Desktop/kenken-3.png +append ~/Desktop/kenken_stitched.png'
ripaudio () { ffmpeg -i $1 -vn -acodec libmp3lame -ab 192k $2 }
git() {hub "$@"}
alias archive_kill='kill -9 `ps aux | grep archive | awk {'print $2'} | head -n 1`'
alias flac_convert='for f in *.flac; do ffmpeg -i "$f" -acodec alac "${f%.flac}.m4a"; done'
