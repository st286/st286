
## for proxy:
alias pon='networksetup -setsocksfirewallproxy wi-fi 127.0.0.1 1080'
alias poff='networksetup -setsocksfirewallproxystate wi-fi off'


#alias upon='networksetup -setsocksfirewallproxy "iPhone USB" 127.0.0.1 1080'
#alias upoff='networksetup -setsocksfirewallproxystate "iPhone USB" off'

#alias l='ls -lAFh'

alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# alias crocs='croc --relay "ccceye.com:9009" send'

## bye-bye, trojan-go
# alias tr='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./dmit143.yaml'
# alias tra='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./atlanta.yaml'
# alias trg='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./gia-lt.yaml'
# alias trn='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./nj.yaml'
# alias tr360='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./dmit360.yaml'
# alias tr360v6='cd ~/VPS/trojan-go && pon && ./trojan-go -config ./dmit360v6.yaml'

PS1="%n %~ %#"

##cd trojan-go

## in .zlogout
## poff
## 
