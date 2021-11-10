# Some program for macOS

#  How to reinstall Rosetta 2

[Fix Apps Crashing on M1 Pro/Max Mac After Migration Assistant or Monterey Update](https://osxdaily.com/2021/11/08/fix-app-crashing-apple-silicon-mac/)

The simplest way to reinstall Rosetta 2 is by opening the Terminal application, found via Spotlight (Command+Spacebar and typing Terminal), or by going the /Applications/Utilities/ folder, and then issuing the following command string:

    /usr/sbin/softwareupdate --install-rosetta --agree-to-license

Hit Return to execute the command, and reinstall Rosetta on the Mac.

Once Rosetta has finished installing (again), try relaunching the apps, and they should work fine as expected again.

