
## Installing Atom on Linux (mint debian ubuntu)

[Installing Atom on Linux](https://flight-manual.atom.io/getting-started/sections/installing-atom/)

**Debian and Ubuntu (deb/apt)**

To install Atom on Debian, Ubuntu, or related distributions, add our official
package repository to your system by running the following commands:

```shell
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
sudo apt-get update
```

You can now install Atom using apt-get (or apt on Ubuntu):

```shell
# Install Atom
sudo apt-get install atom
# Install Atom Beta
sudo apt-get install atom-beta
```
