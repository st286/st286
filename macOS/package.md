# Packae Managers

---
### [Homebrew vs. MacPorts package managers](https://www.scivision.dev/homebrew-macports-fink/)

## [一、MacPorts](https://www.macports.org/)

#### [Macport Guide](https://guide.macports.org/)

#### [Migrating MacPorts](https://trac.macports.org/wiki/Migration)

#### [Quickstart](https://www.macports.org/install.php)

---
**Port command:**

help:

`port help`

port selfupdate:

`sudo port -v selfupdate`

list installed ports:

`port -qv installed`

list requested ports:

`port echo requested`

list outdated port:

`port outdated`

Uninstall all installed ports:

`sudo port -f uninstall installed`

Run a regular clear out of your installation:

`sudo port reclaim`

uninstall the dependencies:

`sudo port uninstall --follow-dependencies xxx-port`
 
Ports installed on my MacBook Air:

`wget`  `htop`  `netwox` 

===
Warning: Error parsing file /Applications/MacPorts/Python 3.11/Build Applet.app/Contents/MacOS/Python: Error opening or reading file

```
sudo port -f deactivate python311
sudo port activate python311
```
[the link](https://macports-users.macosforge.narkive.com/sYqkuBdz/stuck)

===

### Network-Tools:

[netwox](https://ports.macports.org/port/netwox/) ` sudo port install netwox `

[netwag](https://ports.macports.org/port/netwag/)  ` sudo port install netwag `


[goldendict](https://ports.macports.org/port/goldendict/)

`sudo port install goldendict    ## M1 etc apple silicon Not Supported`
        
## [二、Homebrew](https://brew.sh)

The Missing Package Manager for macOS (or Linux)
```
###  Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

### Uninstall Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
```
add Homebrew to your PATH:

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hyh/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    
Run brew help to get started

#### [Install GoldenDict on Mac](https://brewinstall.org/install-goldendict-mac-osx/)

        brew install --cask goldendict
