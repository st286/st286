## for proxy:
  2 alias pn='networksetup -setsocksfirewallproxy wi-fi 127.0.0.1 1080'
  3 alias pf='networksetup -setsocksfirewallproxystate wi-fi off'
  4 alias upn='networksetup -setsocksfirewallproxy "iPhone USB" 127.0.0.1 1080'
  5 alias upf='networksetup -setsocksfirewallproxystate "iPhone USB" off'
  6
  7 #alias l='ls -lAFh'
  8 alias ll='ls -lhF'
  9 alias la='ls -ahlF'
 10 alias l='ls -CF'
 11
 12 # yt-dlp
 13 alias ymp='yt-dlp  -x --audio-format mp3 --trim-filenames 48  --proxy socks5://127.0.0.1:1080/ '
 14 alias ym='yt-dlp   -x --audio-format mp3 --trim-filenames 48  '
 15
 16 ## flush dns cache
 17 alias flushds='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
 18
 19
 20 PS1="%n %~ %#"
 21
 22 ## MacPorts PATH variable
 23 # export PATH=/opt/local/bin:/opt/local/sbin:$PATH
 24
 25 # Emacs and Vi modes in Bash
 26 set -o vi
 27 #set -o emacs
 28
 29 # set default editor to Vim
 30 export EDITOR=vim
 31
 32
 33 # 不记录历史命令
 34 unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG
 35 export HISTFILE=/dev/null
 36 export HISTSIZE=128
 37 export HISTFILESIZE=0
 38
 39
 40 alias c='pn && cd ~/TUIC1.0/'
 41 alias t='tuic-client -c '

