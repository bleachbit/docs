---
layout: page
title: "Introduction"
category: cml
date: 2000-01-01 00:01:00
# The date is set to an old date to keep this article first in its section.
redirect_from:
 - doc/cleanerml
order: 1
---

**CleanerML** is a simple yet powerful markup language for writing cleaners. Most of BleachBit's cleaners are written in CleanerML, and you can write your own cleaners in CleanerML too.

You can think of it as writing XML to delete files, but it is more powerful than that. CleanerML's features include:

* Familiar XML
* Open standard
* Delete, truncate, or shred files
* Delete Windows registry keys and named values
* Perform specialized operations (see [Actions](#actions))
* Find files by glob, walking a tree, or 'deep scan'
* Refine a file search with a regular expression
* Export to gettext for translation using standard tools such as Launchpad
* Operating system detection to discard OS-specific cleaners (such as Winamp) at runtime
* XSD (XML Schema Definition) for validation

### Storage

During application startup, BleachBit looks for CleanerML files in a few standard locations:

*   `/usr/share/bleachbit/cleaners/` on Linux
*   `~/.config/bleachbit/cleaners/` on Linux
*   `share/cleaners/` relative to the Python script on Linux (useful for running BleachBit from source without installation
*   `share\cleaners\` relative to the BleachBit executable on Windows which typically translates to ```c:\program files\bleachbit\share\cleaners```
    Warning: This directory is deleted when BleachBit is updated or uninstalled.
*   `%APPDATA%\BleachBit\cleaners\` on Windows which typically translates to `C:\Users\(username)\AppData\Roaming\BleachBit\Cleaners\`

Most of these locations are also scanned for [winapp2.ini](/doc/winapp2ini.html) files, but you may only use one winapp2.ini file.

The diagnostics section of the application lists these directories.


### Learning CleanerML

To learn CleanerML so you can write your own cleaner, read these resources:

*   [Example cleaner](https://github.com/bleachbit/bleachbit/blob/master/doc/example_cleaner.xml) with many annotations
*   [Cleaners that come standard with BleachBit](https://github.com/bleachbit/bleachbit/tree/master/cleaners)
*   [Bonus cleaners](https://github.com/bleachbit/cleanerml)
*   [XSD (XML Schema Definition)](https://github.com/bleachbit/bleachbit/blob/master/doc/cleaner_markup_language.xsd) used for validation

### Finding files to delete

See [Finding files to delete](/cml/finding_files_to_delete.html).

### Matching files

CleanerML allows several ways to match files:

*   **file**: matches a single file.
*   **glob**: matches one or more files with a simple pattern. See the Python documentation on [glob](https://docs.python.org/2/library/glob.html).
*   **walk.files**: matches all files under a directory (but does not match directories).
*   **walk.all**: matches all files and directories under a directory (but not the top directory).
*   **walk.top**: matches all contents of a directory and the top directory itself.
*   **deep**: queues a deep scan

What is the difference between a **deep** and **walk.files**? Deep scan expects file matches to be loosely scattered (such as Thumbs.db), but **walk.files** expects to match most files under that directory (such as Firefox's cache). To improve performance, BleachBit combines deep scans for the same directory (such as all deep scans for $HOME). In the future, BleachBit may allow the user to reconfigure the deep scan directory, so, for example, he can scan a network drive in addition to his home directory.

Any of these methods can be combined with [Python's Perl regular expressions](https://docs.python.org/2/howto/regex.html) for sophisticated filtering. The regular expression options are:

* **regex**: require the path, not including the directory, to match the expression
* **nregex**: require the path, not including the directory, to *not* match the expression
* **wholeregex**: require the full path to match the expression
* **nwholeregex**: require the full path to *not* match the expression

Another way to filter is using with **type**:
* **type="f"**: matches files
* **type="d"**: matches directories
* When unspecified, any kind of file system object will match

For more information, refer to the section [Learning](#learning-cleanerml).

### Actions

The **action** element is a child of the **option** element.

Values for the **comand** attribute of the **action** element:

* **apt.autoclean**
* **apt.autoremove**
* **chrome.autofill**
* **chrome.databases_db**
* **chrome.favicons**
* **chrome.history**
* **chrome.keywords**
* **delete**: delete a file
* **ini**: delete part of a .ini configuration file
* **json**: delete part of a JSON file
* **mozilla_url_history**
* **office_registrymodifications**: clean the MRU for OpenOffice.org and LibreOffice
* **process**: launch a process
* **sqlite.vacuum**: vacuum an SQLite 3 database
* **truncate**: truncate a file
* **win.shell.change.notify**
* **winreg**: delete a Windows registry key or value
* **yum.clean_all**

Actions take an optional **os** attribute to limit the action to certain operating systems.

### Operating system

The optional attribute **os** limits the scope of an element to certain operating systems.

Supported elements are

* **action**
* **cleaner**
* **running**
* **value** under **var**

Valid values for *os* are:

* **bsd**
* **darwin**
* **linux**
* **netbsd**
* **openbsd**
* **unix**: Darwin, Linux, or any BSD
* **windows**

### Running process

Set the *running* element to abort cleaning when an application is running. It accepts two attributes:

* **type**: required, either: **exe** for process name or **pathname** for a file on the file system
* **os**: optional, any value for the operating system

### Variables

BleachBit supports expansion of a variety of variables: tilde (home), environment variables, and
multi-value variables. For more information, see [Variables](/cml/variables.html).

### Sharing your cleaner

Of course, you may use your cleaner privately. If you wish to share it with others, see [Contribute Cleaner](/cml/contributing.html).



