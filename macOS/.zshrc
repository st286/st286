## for proxy:
alias pn='networksetup -setsocksfirewallproxy wi-fi 127.0.0.1 1080'
alias pf='networksetup -setsocksfirewallproxystate wi-fi off'

alias upn='networksetup -setsocksfirewallproxy "iPhone USB" 127.0.0.1 1080'
alias upf='networksetup -setsocksfirewallproxystate "iPhone USB" off'


#alias l='ls -lAFh'

alias ll='ls -lhF'
alias la='ls -ahlF'
alias l='ls -CF'

#yt-dlp_macos

alias ytmp='yt-dlp_macos -x --audio-format mp3 --trim-filenames 30  --proxy socks5://127.0.0.1:1080/ '
alias ytm='yt-dlp_macos -x --audio-format mp3 --trim-filenames 30  '

## flush dns cache
alias flushds='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'

# alias emacs='emacs -nw'
# emacs server and emacsclient
alias es='emacs -nw --daemon=st-emacs'
alias ec='emacsclient -s st-emacs'


PS1="%n %~ %#"

## MacPorts PATH variable
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

## yt-dlp_macos
export PATH=/usr/local/bin:$PATH

## golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

## in .zlogout
## pf
##

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## Running Emacs.app from the command line. prefer it to stay in the terminal instead of launching a macOS window
#export EDITOR="emacs -nw"
#export VISUAL="emacs -nw"

# 不记录历史命令
unset HISTORY HISTFILE HISTSAVE HISTZONE HISTORY HISTLOG; export HISTFILE=/dev/null; export HISTSIZE=0; export HISTFILESIZE=0



