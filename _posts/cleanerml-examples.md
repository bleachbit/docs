---
layout: page
title: "CleanerML Examples"
category: doc
date: 2019-03-09 03:40:00
order: 8
---

**Just some CleanerML Examples...**

### Header

`<cleaner id="windows" os="windows">`  
If the cleaner is only for Windows.

`<label translate="true">Deep Scan - More</label>`  
If the label should be translated by the translators into local.

`<label translators="In Windows 'Run' is the dialog in the Start menu">Run</label>`  
Note for translators.

<br>

### Display a warning

**Display a warning to the user**  
Displays a warning to the user if the cleaner gets selected in BleachBit.

**Example:**  
`<warning>Use the option only if you know what you do!</warning>`

**Explanaition:**  
`<warning>` gets used inside the `<option>` section, on top, as first rule.

<br>

### command="ini"

**Cleaning a Parameter in a INI File**  
Deletes in `section` the `parameter`.

**Example:**  
`<action command="ini" search="file" path="%AppData%\GHISLER\wincmd.ini" section="MkDirHistory" parameter="0"/>`

**Explanaition:**  
`command` is always `"ini"`, `search` is always `"file"`, `path` is the path to the INI file, `section` is the higer section and `parameter` is the parameter you want to delete.

`<action command="ini" search="file" path="%AppData%\GHISLER\wincmd.ini" section="MkDirHistory" parameter="MkDir*"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**You must list them all with one rule per parameter!**  

<br>

### command="winreg"

**Cleaning a Windows Registry Key/Path**  
Deletes in the `path` (tree in Regedit) a "folder", or a key.

**Example:**  
`<action command="winreg" path="HKCU\Software\Adobe\Acrobat Reader\5.0\AVGeneral\cRecentFiles" name="StoreLocation"/>`

**Explanaition:**  
`command` is always `"winreg"`, `path` is the path/tree/folder, `name` is the key that gets delete.  
If you don't add a `name` to it, the `path` gets deleted!

<br>

### Cleaning a Windows Registry Key/Path with a wildcard

**You can cleaning a Windows Registry Key/Path with a wildcard**  
Deletes in the `path` (tree in Regedit) a "folder", or a key with a wildcard.

**Example:**  
`<action command="winreg" path="HKCU\Software\XnView\Start\FileName_*" />`

**Explanaition:**  
`command` is always `"winreg"`, `path` is the path/tree/folder/key you want to delete, "*" match any string that will be find.

<br>

### command="delete" search="file"

**Deleting a single file**  
Deletes a single file in the file system.

**Example:**  
`<action command="delete" search="file" path="$APPDATA\XnView\XnView.db"`

**Explanaition:**  
`command` is always `"delete"`, `search` is always `"file"`, `path` is the path & name of the file to delete.

`<action command="delete" search="file" path="%ProgramFiles%\BiglyBT\*.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  


<br>

### command="delete" search="walk.files"

**Follows**  
Follows

**Example:**  
Follows

**Explanaition:**  
Follows

`<action command="delete" search="walk.files" path="%ProgramFiles%\BiglyBT\*.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="walk.files" path="%ProgramData%\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\*"/>`  
**Doesn't work! No `*` at the end allowed (, yet)!**  
**Use `glob`!**  

<br>

### command="delete" search="walk.all"

**Follows**  
Follows

**Example:**  
Follows

**Explanaition:**  
Follows ... walk.all is intended to match directories, not files.

If you add a "*" at the end of a path by `walk.all`, nothing gets deleted!  
`<action command="delete" search="walk.all" path="%windir%\Temp\*"/>`

And this doesn't work, too.   
`<action command="delete" search="walk.all" path="%windir%\Temp\WER*.hdmp"/>`  
Use `glob` instead:  
`<action command="delete" search="glob" path="%windir%\Temp\WER*.hdmp"/>`

<br>

### command="delete" search="glob"

**Follows**  
Follows

**Example:**  
`<action command="delete" search="glob" path="%windir%\Temp\WER*.hdmp"/>`

**Explanaition:**  
Follows ... and don't go into the subfolders.

<br>

### Delete the content of a folder and the folder itself

**You can delete the content of a folder and the folder itself**  
Follows

**Example:**  
`<action command="delete" search="walk.all" path="$LocalAppData\Temp\acrord32_sbx"/>`  
`<action command="delete" search="glob" path="$LocalAppData\Temp\acrord32_sbx"/>`

**Explanaition:**  
`walk.all` deletes the content of the folder and shows it in BleachBit, while `glob` deletes after that the folder itself.

<br>

### Delete the content of a folder but not the folder itself

**You can delete the content of a folder and not the folder itself**  
Follows

**Example:**  
`<action command="delete" search="walk.all" path="$LocalAppData\Temp\acrord32_sbx"/>`  
`<action command="delete" search="glob" path="$LocalAppData\Temp\acrord32_sbx\*"/>`

**Explanaition:**  
`walk.all` deletes the content of the folder and shows it in BleachBit, while `glob` with a `\` at the end of `path` deletes the folders in the folder.

<br>

### command="delete" search="deep"

**Follows**  
Follows

**Example:**  
`<action command="delete" search="deep" cache="false" regex="\.[Ll][Oo][Gg]$"/>`

**Explanaition:**  
Follows

**More examples:**  
`regex="\.[Bb][Aa][Kk]$"` -> File Extension, not key sensetive  
`regex="^Thumbs\.db$"` -> Exact file name  
`regex="^`[...] -> File name starts with  
`regex="\.`[...] -> File extension is  

<br>

### Run an external program

**Follows**  
Follows

**Example:**  
`<action command="process" cmd="taskkill.exe /f /IM explorer.exe"/>`

**Explanaition:**  
Follows

**More examples:**  
`<action command="process" wait="false" cmd="%WINDIR%\explorer.exe %WINDIR%\explorer.exe"/>`  
`wait="false"` -> ...Explanaition...Follows...  
`<action command="process" cmd="cmd.exe /c Cleanmgr.exe"/>`  
You can use `cmd.exe` to start other programs.  
