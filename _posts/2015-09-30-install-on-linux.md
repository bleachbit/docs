---
layout: page
title: "Install on Linux"
category: doc
date: 2015-09-30 20:37:20
order: 1
---


To install BleachBit, first <a href="http://bleachbit.sourceforge.net/download">download</a> the latest installation package for your system.

### Requirements

BleachBit requires Python 2.5, 2.6, or 2.7 (not 3) and GTK+ version 2 (not 3). There is an experimental branch with support for GTK+3.


### Ubuntu, Mint, and Debian

Double click on the downloaded installation package which has a name like <tt>bleachbit_1.6_all_ubuntu1404.deb</tt>. Then, follow the prompts.

Alternatively, install using the command line like this:

`sudo dpkg -i bleachbit_1.6_all_ubuntu1404.deb`

Installing using apt from the distribution's repositories is _not_ recommended because they tend to be old releases of BleachBit.

### Fedora, Red Hat, CentOS, Mandriva

Double click on the downloaded installation package which has a name like <tt>bleachbit-1.4-1.1.fc20.noarch.rpm</tt>. Then, follow the prompts.

Alternatively, install using the command line like this:

`sudo rpm -Uvh bleachbit-1.4-1.1.fc20.noarch.rpm`

### Digital signatures

The SHA256 sum of all released files is signed using [this public key](http://bleachbit.sourceforge.net/bleachbit_public.key). Look in the [SourceForge release directory](http://sourceforge.net/projects/bleachbit/files/bleachbit/) for files with the name like <tt>bleachbit-(version)-sha256sum.txt.asc</tt>.
