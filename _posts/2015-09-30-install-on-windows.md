---
layout: page
title: "Install on Windows"
category: doc
date: 2015-09-30 20:37:24
order: 1
---

To install BleachBit, first <a href="https://www.bleachbit.org/download">download</a> the latest installation package for your system.

BleachBit version 4 is supported on Windows Vista, 7, 8, 8.1, or 10 (32-bit or 64-bit). BleachBit version 2.2 was the last version [intended to run](https://github.com/bleachbit/bleachbit/issues/947) on Windows XP.

Most Windows users want the standard installation. If you prefer to run in portably on a USB disk or on a system the administrators that prevents installation, use the portable installation.

#### Standard Installation

Run the installer which has a name like <tt>BleachBit-1.6-setup.exe</tt>. Then, follow the prompts.

Verify the installer is from a verified publisher (Andrew Ziem).

![BleachBit 1.0 Windows 8 User Access Control verified publisher](https://lh6.googleusercontent.com/-UJw5HRIY5Q4/UoWhya1zE6I/AAAAAAAADOk/E3zBkhxE4GE/s800/bleachbit-10-user-access-control-signed.png)

#### Silent Installation

Silent installation installs the application without any prompts from the user, and it is typically used by system administrators to install an application across many systems.

For BleachBit version 2.2, run this command to instal the aupplication for all users:

`BleachBit-2.2-setup.exe /S /allusers`

To install for only the current user, do this:

`BleachBit-2.2-setup.exe /S /currentuser`

The switches `/allusers` and `/currentuser` were first supported in BleachBit version 2.2

The `/S` switch _is_ case-sensitive.

#### Portable Use

Download the package which has a name like <tt>BleachBit-1.6-portable.zip</tt>. Then use a standard unzip utility to unpack the file. Such a utility is included with Windows: just right click on the <tt>.zip</tt> file and choose **Extract all files** which creates a new folder.

Do not double click on the <tt>.zip</tt> file.

