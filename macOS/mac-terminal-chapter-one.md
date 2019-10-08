
Macintosh Terminal Pocket Guide

## Chapter1: The Macintosh Terminal

The Terminal is an application that runs commands. OS X comes with over 1,000 commands for file manipulation, text editing, printing, mathematics, computer programming, typesetting, networking...you name it. Commands are case-sensitive

```shell
  wc -l -w myfile # Two individual options
  
  wc -lw myfile   # Same as -l -w
  
  wc -l myfile1 myfile2 # Count lines in two files
  
```

### Ten Commands to Try

```shell
  cal apr 2019       # Display a calendar for April, 2019
  
  ls /Applications   # List the contents of the Applications folder
  
  ls $HOME/Documents | wc -l    # Count the number of items in your Documents folder
  
  df -h /            # See how much space is used on your internal hard disk
  
  top                # Watch the processes running on your Mac
  
  lpr /etc/hosts     # Print the file /etc/hosts on your default printer
  
  last -l $USER      # See how long you’ve been logged in to your Mac
  
  # Download a PDF file from the Internet to your Mac desktop
  
  curl -O http://www.blazemonger.com/sample.pdf
  
  mv sample.pdf $HOME/Desktop
  
  # Display the IP address of your Mac
  
  ipconfig getifaddr en0 # For wired
  
  ipconfig getifaddr en1 # For wireless

  whois oreilly.com | less    # See who owns the domain name oreilly.com
  
  # Finally, clear the window and exit Terminal
  
  clear
  
  exit
  
````
