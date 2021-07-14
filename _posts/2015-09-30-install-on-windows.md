---
layout: page
title: "Install on Windows"
category: doc
date: 2015-09-30 20:37:24
order: 1
---

To install BleachBit, first <a href="https://www.bleachbit.org/download">download</a> the latest installation package for your system.

BleachBit version 4 is supported on Windows 8, 8.1, or 10 (32-bit or 64-bit).

Most Windows users want the standard installation. If you prefer to run in portably on a USB disk or on a system the administrators that prevents installation, use the portable installation.

#### Standard Installation

Run the installer which has a name like <tt>BleachBit-4.4.1-setup.exe</tt>. Then, follow the prompts.

Verify the installer is from a verified publisher (Andrew Ziem).

![BleachBit 1.0 Windows 8 User Access Control verified publisher](https://lh6.googleusercontent.com/-UJw5HRIY5Q4/UoWhya1zE6I/AAAAAAAADOk/E3zBkhxE4GE/s800/bleachbit-10-user-access-control-signed.png)

#### Silent Installation

Silent installation installs the application without any prompts from the user, and it is typically used by system administrators to install an application across many systems.

Using BleachBit 4.4.1 as an example, run the following command to install the application for all users. It requires the calling process to have administrator privileges;

`BleachBit-4.4.1-setup.exe /S /allusers`

To install for only the current user, run this command:

`BleachBit-4.4.1-setup.exe /S /currentuser`

To omit the desktop shortcut, add `/NoDesktopShortcut` directly after `/S`.

`BleachBit-4.4.1-setup.exe /S /NoDesktopShortcut /currentuser`

Because the installer is silent, it will not throw an error such as if you forget to choose between `/allusers` and `/currentuser` or if the calling process has insufficient privileges.

The `/S` and `/NoDesktopShortcut` switches _are_ case-sensitive.

The switches `/allusers` and `/currentuser` were first added in BleachBit version 2.2.

The switch `/NoDesktopShortcut` was added in BleachBit 4.4.1.

#### Portable Use

Download the package which has a name like <tt>BleachBit-4.4.1-portable.zip</tt>. Then use a standard unzip utility to unpack the file. Such a utility is included with Windows: just right click on the <tt>.zip</tt> file and choose **Extract all files** which creates a new folder.

Do not double click on the <tt>.zip</tt> file.

