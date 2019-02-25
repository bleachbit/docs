---
layout: page
title: "CleanerML Examples"
category: doc
date: 2019-02-25 08:45:00
order: 8
---

**Just some CleanerML Examples...**

### INI

Cleaning a Parameter in a INI File:
Deletes in `section` the `parameter'.

Example:
```<action command="ini" search="file" path="%AppData%\GHISLER\wincmd.ini" section="MkDirHistory" parameter="0"/>```

`command` is always `"ini"`, `search` is always `"file"`, `path` is the path to the INI file, `section` is the higer section and `parameter` is the parameter you want to delete.
#No wildcards allowed (, yet)!


### WINREG

Cleaning a Windows Registry Key/Path:
Deletes in the `path` (tree in Regedit) a "folder", or a key.

Example:
```<action command="winreg" path="HKCU\Software\Adobe\Acrobat Reader\5.0\AVGeneral\cRecentFiles"/>```

`command` is always `"winreg"`, `path` is the path/tree/folder/key you want to delete.


Cleaning a Windows Registry Key/Path with a wildcard:
Deletes in the `path` (tree in Regedit) a "folder", or a key with a wildcard.

Example:
```<action command="winreg" path="HKCU\Software\XnView\Start\FileName_*" />```

`command` is always `"winreg"`, `path` is the path/tree/folder/key you want to delete, "*" match any string that will be find.


