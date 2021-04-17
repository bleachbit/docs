---
layout: page
title: "Running from source code"
category: dev
date: 2015-09-25 23:40:58
---

Running BleachBit from source code is intended for developers and testers: other users should install [the prepared packages](https://www.bleachbit.org/download). Running BleachBit from source code is relatively easy because there is nothing to compile and installing BleachBit is not required.

## Linux

Linux systems often have the necessary dependencies installed for running BleachBit from source code. 

### BleachBit 3.x

On Debian and Ubuntu, install the `python-gtk2` package. On Fedora, CentOS, and Red Hat, install the `pygtk2` package.

### BleachBit 4.x

On Debian and Ubuntu, install these packages: `gir1.2-gtk-3.0`, `libgtk-3-0`, and `python3-gi`. On Fedora, CentOS, and Red Hat, install `gtk3`, `python3-chardet`, and `python3-gobject`.


## Microsoft Windows

On Microsoft Windows you must install several dependencies:


### BleachBit 3.x

*   [Python 2.7 32-bit](https://www.python.org/ftp/python/2.7.8/python-2.7.8.msi)
*   [PyGTK all-in-one installer](https://ftp.gnome.org/pub/GNOME/binaries/win32/pygtk/2.24/pygtk-all-in-one-2.24.2.win32-py2.7.msi)
*   [Python for Windows Extensions](https://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win32-py2.7.exe/download)

Python, GTK+, and all Python extensions should be 32-bit. Mixing 64-bit and 32-bit components will cause errors.

Alternatively, use [gtk-download.sh](https://github.com/bleachbit/bleachbit-misc/blob/master/gtk-download.sh) and [gtk-unpack.sh](https://github.com/bleachbit/bleachbit-misc/blob/master/gtk-unpack.sh).

### BleachBit 4.x

Follow the installation steps in [appveyor.yml](https://github.com/bleachbit/bleachbit/blob/master/appveyor.yml).

## Getting the source code

To get the source code, either download the latest tarball (.tar.bz2) or checkout the Git source repository from Git, which always contains the latest code.

### Tarball

On Linux unpack a tarball run these commands:

```
tar xvjf bleachbit-3.2.0.tar.bz2
cd bleachbit-0.3.2.0
```

On Windows unpack the tarball with [7-Zip](http://www.7-zip.org/) or similar application.

### Git

On Linux, install the Git client. On Debian and Ubuntu install it with this command:

`sudo apt-get install git`

Similarly, on Fedora, Red Hat, and CentOS install the Git client with this command:

`sudo yum install git-core`

On Linux clone the Git repository for the BleachBit application with this command:

`git clone https://github.com/bleachbit/bleachbit.git`

Here is a full list of BleachBit Git repositories:

*   [BleachBit](https://github.com/bleachbit/bleachbit): main BleachBit application
*   [bleachbit-misc](https://github.com/bleachbit/bleachbit-misc): supports development
*   [CleanerML](https://github.com/bleachbit/cleanerml): extra cleaners
*   [winapp2.ini](https://github.com/bleachbit/winapp2.ini): winapp2.ini cleaners database for Windows

### Building translations

If English is not your native language, you must build the translations. On Linux, run:

`make -C po local`

Building translations is not supported on Windows, but you can copy the translations from another system or download them from Launchpad. Relative to ```bleachbit.py``` put the ```bleachbit.mo``` file in a directory called ```.\locale\es\LC_MESSAGES\``` (change ```es``` according to the language.)

### Running from source

Now that the dependencies are installed, you are ready to run BleachBit. On Linux with BleachBit 3.x, run `python bleachbit.py`. On Linux with BleachBit 4.x, run `python3 bleachbit.py`.

On Windows, double click on `bleachbit.py`.

### Staying up to date with Git

The Git repository changes frequently. To download changes, run these commands:

```
git pull
make -C po local
```

### Further reading

*   [Testing](/dev/testing.html)
*   [Contributing patches and bug reports](https://www.bleachbit.org/contribute)


