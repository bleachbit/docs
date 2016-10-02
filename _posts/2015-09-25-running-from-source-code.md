---
layout: page
title: "Running from source code"
category: dev
date: 2015-09-25 23:40:58
---

Running BleachBit from source code is intended for developers and testers: other users should install [the prepared packages](http://bleachbit.sourceforge.net/download). Running BleachBit from source code is relatively easy because there is nothing to compile and installing BleachBit is not required.

## Linux

Linux systems almost always have the necessary dependencies installed for running BleachBit from source code. On Debian and Ubuntu, you should have the ```python-gtk2``` package. On Fedora, CentOS, and Red Hat you should have the ```pygtk2``` package installed.

## Microsoft Windows

On Microsoft Windows you must install several dependencies:

*   [Python 2.7 32-bit](https://www.python.org/ftp/python/2.7.8/python-2.7.8.msi)
*   [PyGTK all-in-one installer](http://ftp.gnome.org/pub/GNOME/binaries/win32/pygtk/2.24/pygtk-all-in-one-2.24.2.win32-py2.7.msi)
*   [Python for Windows Extensions](http://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win32-py2.7.exe/download)

Python, GTK+, and all Python extensions should be 32-bit. Mixing 64-bit and 32-bit components will cause errors.

Alternatively, use [gtk-download.sh](https://github.com/az0/bleachbit-misc/blob/master/gtk-download.sh) and [gtk-unpack.sh](https://github.com/az0/bleachbit-misc/blob/master/gtk-unpack.sh).

## Getting the source code

To get the source code, either download the latest tarball (.tar.bz2) or checkout the Git source repository from Git, which always contains the latest code.

### Tarball

On Linux unpack a tarball run this command:

`tar xvjf bleachbit-0.7.1.tar.bz2 cd bleachbit-0.7.1`

On Windows unpack the tarball with [7-Zip](http://www.7-zip.org/) or similar application.

### Git

On Linux, install the Git client. On Debian and Ubuntu install it with this command:

`sudo apt-get install git`

Similarly on Fedora, Red Hat, and CentOS install the Git client with this command:

`sudo yum install git-core`

On Linux checkout the BleachBIt application Git repository (read only) with this command:

`git clone https://github.com/az0/bleachbit.git`

Here is a full list of BleachBit Git repositories:

*   [BleachBit](https://github.com/az0/bleachbit): main BleachBit application
*   [bleachbit-misc](https://github.com/az0/bleachbit): supports development
*   [CleanerML](https://github.com/az0/cleanerml): extra cleaners
*   [winapp2.ini](https://github.com/az0/winapp2.ini): winapp2.ini cleaners database for Windows

### Building translations

If English is not your native language, you must build the translations. On Linux, run:

`make -C po local`

At this time building translations is not supported on Windows, but you can copy the translations from another system or download them from Launchpad. Relative to ```bleachbit.py``` put the ```bleachbit.mo``` file in a directory called ```.\locale\es\LC_MESSAGES\``` (change ```es``` according to the language.)

### Running from source

Now that the dependencies are installed, you are ready to run BleachBit. On Linux run:

`python bleachbit.py`

On Windows, click on ```bleachbit.py```.

### Staying up to date with Git

The Git repository changes frequently. To download changes, run these commands:

````
git pull
make -C po local
````

### Further reading

*   [Testing](http://bleachbit.sourceforge.net/contribute/testing)
*   [Contributing patches and bug reports](http://bleachbit.sourceforge.net/contribute)


