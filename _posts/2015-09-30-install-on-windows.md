---
layout: page
title: "Install on Windows"
category: doc
date: 2015-09-30 20:37:24
order: 1
---

To install BleachBit, first <a href="https://www.bleachbit.org/download">download</a> the latest installation package for your system.

BleachBit version 4 is supported on Windows 10 and 11 (32-bit or 64-bit).

#### Standard Installation

Most Windows users want the standard installation.

First, run the installer, which has a name like <tt>BleachBit-4.6.2-setup.exe</tt>. Then, follow the prompts.

Verify the installer comes from the verified publisher shown in the screenshot.

![BleachBit 4.6.2 Windows 10 User Access Control verified publisher](/images/windows-10-verified-publisher-certum.png)

#### Portable Use

While installation is the typical way of using BleachBit, some users prefer an alternative. They may want to put the application on a removable drive or use it on a system without system permission to run installers, but a downside is that the context menu integration is not supported.

To run in portable mode, download the package, which has a name like <tt>BleachBit-4.6.2-portable.zip</tt>. Then use a standard unzip utility to unpack the file. Such a utility is included with Windows: just right-click on the <tt>.zip</tt> file and choose **Extract all files** which creates a new folder.

Do not double-click on the <tt>.zip</tt> file.

#### Silent Installation

Silent installation is for advanced users or system administrators. This feature installs the application without any prompts from the user, and system administrators use it to automate the process of installing an application across many systems.

Using BleachBit 4.6.2 as an example, run the following command to install the application for all users. It requires the calling process to have administrator privileges:

`BleachBit-4.6.2-setup.exe /S /allusers`

To install for only the current user, run this command:

`BleachBit-4.6.2-setup.exe /S /currentuser`

To omit the desktop shortcut, add `/NoDesktopShortcut` directly after `/S`:

`BleachBit-4.6.2-setup.exe /S /NoDesktopShortcut /currentuser`

Because the installer is silent, it will not throw an error such as if you forget to choose between `/allusers` and `/currentuser` or if the calling process has insufficient privileges.

The `/S` and `/NoDesktopShortcut` switches _are_ case-sensitive.

The switch `/NoDesktopShortcut` was added in BleachBit 4.4.1.

#### After Installation

After installation, review the [preference options](/doc/preferences.html) or skip to [general usage](/doc/general-usage.html).
