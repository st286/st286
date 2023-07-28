## for proxy:
   alias pn='networksetup -setsocksfirewallproxy wi-fi 127.0.0.1 1080'
   alias pf='networksetup -setsocksfirewallproxystate wi-fi off'
   alias upn='networksetup -setsocksfirewallproxy "iPhone USB" 127.0.0.1 1080'
   alias upf='networksetup -setsocksfirewallproxystate "iPhone USB" off'
  
   #alias l='ls -lAFh'
   alias ll='ls -lhF'
   alias la='ls -ahlF'
   alias l='ls -CF'
 
   # yt-dlp
   alias ymp='yt-dlp  -x --audio-format mp3 --trim-filenames 48  --proxy socks5://127.0.0.1:1080/ '
   alias ym='yt-dlp   -x --audio-format mp3 --trim-filenames 48  '
  
   ## flush dns cache
   alias flushds='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
 
 
  PS1="%n %~ %#"
 
  ## MacPorts PATH variable
  # export PATH=/opt/local/bin:/opt/local/sbin:$PATH
 
  # Emacs and Vi modes in Bash
  set -o vi
  #set -o emacs
 
  # set default editor to Vim
  export EDITOR=vim
 
 
  # 不记录历史命令
  unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG
  export HISTFILE=/dev/null
  export HISTSIZE=128
  export HISTFILESIZE=0
 
 
  alias c='pn && cd ~/TUIC1.0/'
  alias t='tuic-client -c '

