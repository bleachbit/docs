---
layout: page
title: "Install on Linux"
category: doc
date: 2015-09-30 20:37:20
order: 1
---


To install BleachBit, first <a href="https://www.bleachbit.org/download">download</a> the latest installation package for your system.

### Requirements

BleachBit requires Python 2.5, 2.6, or 2.7 (not 3) and GTK+ version 2 (not 3). There is an experimental branch with support for GTK+3.


### Ubuntu, Mint, and Debian

Double click on the downloaded installation package which has a name like <tt>bleachbit_1.6_all_ubuntu1404.deb</tt>. Then, follow the prompts.

Alternatively, install using the command line like this:

`sudo dpkg -i bleachbit_1.6_all_ubuntu1404.deb`

Installing using apt from the distribution's repositories is _not_ recommended because they tend to be old releases of BleachBit.

### Fedora, Red Hat, CentOS


#### Graphical package manager
To install BleachBit using the graphic package manager, double click on the downloaded installation package which has a name like <tt>bleachbit-1.4-1.1.fc20.noarch.rpm</tt>. Then, follow the prompts.


#### Command line
Alternatively, install using the command line like this.

While installing the public key is not required (a missing key can be ignored), it is recommended to verify the authenticity of the downloaded files.  Without importing the key you may see the following error: "Signature verification failed [4-Signatures public key is not available]." Installing the key is required only once (in other words, not every time you install or upgrade BleachBit). This command downloads and imports the pubic key:

`wget http://bleachbit.sourceforge.net/bleachbit_public.key -O /tmp/bleachbit_public.key
sudo rpm --import /tmp/bleachbit_public.key`

The following command installs BleachBit using the command line:

`sudo rpm -Uvh bleachbit-1.4-1.1.fc20.noarch.rpm`

### Digital signatures

The SHA256 sum of all released files is signed using [this public key](http://bleachbit.sourceforge.net/bleachbit_public.key). Look in the [SourceForge release directory](https://sourceforge.net/projects/bleachbit/files/bleachbit/) for files with the name like <tt>bleachbit-(version)-sha256sum.txt.asc</tt>.
