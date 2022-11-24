

Safari has a hidden Debug menu that you can only turn on using Terminal:

    defaults write com.apple.Safari IncludeInternalDebugMenu 1
  
SCP (Secure CoPy):

    scp ~/Desktop/files/* user@example.org:~/files/
    
## Terminal Basics

 Linux and macOS are UNIX- based operating systems. On macOS, the filesystem isn’t case sensitive. 
 
 The default shell on macOS is Zsh (Z shell), now. 
 
    chsh -s /bin/zsh
    chsh -s /bin/bash
    
Directories
 
    mkdir -v house
    mkdir -p house/kitchen/fridge/milk
    rmdir house/kitchen/fridge/milk
    rmdir -p fridge/milk
    
    rm -r fridge

File Operations

    touch <filename>
    touch ~/Desktop/empty-file
    cat big-quote
    head big-quote
    tail big-quote
    
    cp ~/big-quote ~/Desktop/FortuneMessages
    mv ~/Desktop/FortuneMessages ~/Desktop/FortuneMessages.txt
    rm ~/Desktop/FortuneMessages.txt
    
Editing Text in Terminal

    export EDITOR=/usr/bin/vim
    
Pipe

    cat /var/log/system.log | less
    cat /var/log/system.log | tail -n 4
    fortune > ~/quotes.txt
    fortune >> ~/quotes.txt
    cat ~/non-existent-file > ~/error.msg
    cat ~/non-existent-file > ~/error.msg
    
    cat ~/non-existent-file > ~/error.msg
     
     
    
    
