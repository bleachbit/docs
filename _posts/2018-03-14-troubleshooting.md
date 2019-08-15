---
layout: page
title: "Troubleshooting"
category: doc
date: 2000-03-14 21:36:58
order: 10
---

When something goes wrong, these steps will help you gather information to ask for help or to file a bug report.

## Show system information

Sometimes the system information is helpful to include when asking for help, and here is how to find it.

1. Open BleachBit
2. Click on the Help menu
3. Click on System Information
4. Click the Copy button to copy the information the clipboard.

Then paste the information in your help request.

## Show the application log

### When installed on Windows 10

When BleachBit is installed on Windows 10, use these steps to show logging information in the console. This sets the logging level to the normal level for normal releases, and it sets it to verbose level for beta releases.

1. Click in the Windows search box
2. Type `debug` to search for it
2. Click on **BleachBit Debugging Terminal**

![Screenshot showing how to launch the debugging terminal](/images/debug-windows10.png)

To make logging more verbose for normal releases or to write the log to a file, instead follow these steps.

1. Hold down the **Windows** key while pressing the **R** button. This brings up the Run dialog.
2. Type or paste the command `"%ProgramFiles(x86)%\BleachBit\bleachbit_console.exe" --gui --debug-log=%USERPROFILE%\desktop\bleachbit.log`
3. Click **Run**

![Screenshot of the Windows run dialog](/images/run-dialog-windows10.png)

Please note that in the screenshot above, the whole command cannot be seen because it is wider than the field.

The log will appear on the desktop, and you will also see it live in the console window.

### On Linux

On Linux systems use these steps to show verbose logging information:

1. Open a terminal such as GNOME Terminal
2. Type or paste the command `bleachbit --gui --debug-log=/home/username/bleachbit.log` (while replacing *username* with your system username)

The log will appear in your home directory.

## Where to get help

See [BleachBit support](https://www.bleachbit.org/help) to get help.
