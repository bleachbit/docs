---
layout: page
title: "Running from source code"
category: dev
date: 2015-09-25 23:40:58
---

Running BleachBit from source code is intended for developers and testers: other users should install [the prepared packages](https://www.bleachbit.org/download). Running BleachBit from source code is relatively easy because there is nothing to compile and installing BleachBit is not required.

## Linux

Linux systems often have the necessary dependencies installed for running BleachBit from source code.

On Debian and Ubuntu, install these packages: `gir1.2-gtk-3.0`, `libgtk-3-0`, and `python3-gi`. On Fedora, CentOS, and Red Hat, install `gtk3`, `python3-chardet`, and `python3-gobject`.

## Microsoft Windows

### Official release environment

On Microsoft Windows to replicate the environment used for publishing official releases,
install the special 32-bit build of Python, PyGObject, and GTK. Like vanilla Python,
the special build uses the MSVC compiler. It is built using the vcpkg package manager.

Follow the installation steps in [appveyor.yml](https://github.com/bleachbit/bleachbit/blob/master/appveyor.yml),
which installs a [prebuilt environment from pygtwkin](https://github.com/bleachbit/pygtkwin). (You do not need
to build it yourself.)

### Vanilla 64-bit Python

One way to get 64-bit support is with a vanilla 64-bit Python. It is easy,
but it is CLI only: there is no GUI. It is experimental.

1. Download and install Python 3.13.12 64-bit. Choose to install for all users. Choose the path `c:\python313` (instead of under Program Files).
2. Download BleachBit source from the main repository.
3. Unpack the BleachBit source, like to `c:\projects\bleachbit`.
4. Change directory: `cd /d c:\projects\bleachbit`
5. Create venv: `c:\python313\python.exe -m venv c:\projects\bleachbit\venv`
6. Activate venv. If in cmd.exe, run: `call c:\projects\bleachbit\venv\scripts\activate.bat`
7. Set up the venv: `pip install -r windows\requirements.txt`
8. Run BleachBit CLI using `python.exe bleachbit.py` instead of `bleachbit.exe`.

### MSYS2

Another experimental method for 64-bit support on Windows is with MSYS2. See the [guide by LagunaJim](https://github.com/bleachbit/bleachbit/issues/2019#issuecomment-3941571322). This supports the GUI.

## Getting the source code

To get the source code, either download the latest tarball (.tar.bz2) or checkout the Git source repository from Git, which always contains the latest code.

### Tarball

On Linux unpack a tarball run these commands:

```terminal
tar xvjf bleachbit-5.0.2.tar.bz2
cd bleachbit-5.0.2
```

On Windows unpack the tarball with [7-Zip](http://www.7-zip.org/) or similar application.

### Git

On Linux, install the Git client. On Debian and Ubuntu install it with this command:

```terminal
sudo apt-get install git
```

Similarly, on Fedora, Red Hat, and CentOS install the Git client with this command:

```terminal
sudo yum install git-core
```

On Linux clone the Git repository for the BleachBit application with this command:

```terminal
git clone https://github.com/bleachbit/bleachbit.git
```

Here is a full list of BleachBit Git repositories:

*   [BleachBit](https://github.com/bleachbit/bleachbit): main BleachBit application
*   [pygtwkin](https://github.com/bleachbit/pygtwkin): special build of Python, PyGObject, and GTK
*   [bleachbit-misc](https://github.com/bleachbit/bleachbit-misc): supports development
*   [CleanerML](https://github.com/bleachbit/cleanerml): extra cleaners
*   [winapp2.ini](https://github.com/bleachbit/winapp2.ini): winapp2.ini cleaners database for Windows

### Building translations

If English is not your native language, you must build the translations. On Linux, run:

```terminal
make -C po local
```

Building translations is not supported on Windows, but you can copy the translations from another system or download them from Launchpad. Relative to ```bleachbit.py``` put the ```bleachbit.mo``` file in a directory called ```.\locale\es\LC_MESSAGES\``` (change ```es``` according to the language.)

### Running from source

Now that the dependencies are installed, you are ready to run BleachBit. On Linux with BleachBit 3.x, run `python bleachbit.py`. On Linux with BleachBit 4.x, run `python3 bleachbit.py`.

On Windows, double click on `bleachbit.py`.

### Staying up to date with Git

The Git repository changes frequently. To download changes, run:

```bash
git pull --rebase
make -C po local
```

To see recent changes, run:

```terminal
git log --oneline --graph --decorate -n 20
```

To switch to a tagged release, run:

```terminal
git checkout v5.0.2
```

To switch back to the master branch, run:

```terminal
git checkout master
```

### Further reading

*   [Testing](/dev/testing.html)
*   [Contributing patches and bug reports](https://www.bleachbit.org/contribute)


