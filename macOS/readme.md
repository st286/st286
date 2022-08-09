[推荐几款优秀的开源编程字体](https://blog.csdn.net/gaowencheng01/article/details/110295853?spm=1001.2101.3001.6661.1&utm_medium=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-110295853-blog-103303665.pc_relevant_multi_platform_whitelistv3&depth_1-utm_source=distribute.pc_relevant_t0.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-110295853-blog-103303665.pc_relevant_multi_platform_whitelistv3&utm_relevant_index=1)


---
# for macOS
---
## [Install GoldenDict on Mac](https://brewinstall.org/install-goldendict-mac-osx/)

        brew install --cask goldendict

---
## [MacPorts](https://www.macports.org/)

[Installing MacPorts](https://www.macports.org/install.php)

[Guide](https://guide.macports.org/)

[goldendict](https://ports.macports.org/port/goldendict/)

        sudo port install goldendict    ## M1 etc apple silicon Not Supported
        
---
## [Homebrew](https://brew.sh)

The Missing Package Manager for macOS (or Linux)
```
##Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Uninstall Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```
add Homebrew to your PATH:

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hyh/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
Run brew help to get started

---
## [Command Line Tools for Xcode 14 beta 4](https://developer.apple.com/download/all/?q=Xcode)

   [Command Line Tools for Xcode 13.4](https://download.developer.apple.com/Developer_Tools/Command_Line_Tools_for_Xcode_13.4/Command_Line_Tools_for_Xcode_13.4.dmg)
   
   [XCode & command line download](https://developer.apple.com/xcode/): --> download --> Website to select !
   
   
         xcode-select  -h
  
[How to Install Command Line Tools in Mac OS X (Without Xcode)](https://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/)
  
---
## [osxdaily](https://osxdaily.com)

## [Mac云课堂 ](https://www.youtube.com/channel/UCGHCIkfEHaKT7zsq8wzqeOQ)

------
## [MonitorControl - for Apple Silicon and Intel](https://github.com/MonitorControl/MonitorControl)

Controls your external display brightness and volume and shows native OSD. Use menulet sliders or the keyboard, including native Apple keys!


------
##  YouTube to MP3 Converter, Audio Converter,  mTube

[Mediahuman](https://www.mediahuman.com/)

[Mediahuman Latest version downloads](https://www.mediahuman.com/download.html)

------
##  How to reinstall Rosetta 2

[Fix Apps Crashing on M1 Pro/Max Mac After Migration Assistant or Monterey Update](https://osxdaily.com/2021/11/08/fix-app-crashing-apple-silicon-mac/)

The simplest way to reinstall Rosetta 2 is by opening the Terminal application, found via Spotlight (Command+Spacebar and typing Terminal), or by going the /Applications/Utilities/ folder, and then issuing the following command string:

    /usr/sbin/softwareupdate --install-rosetta --agree-to-license

Hit Return to execute the command, and reinstall Rosetta on the Mac.

Once Rosetta has finished installing (again), try relaunching the apps, and they should work fine as expected again.

