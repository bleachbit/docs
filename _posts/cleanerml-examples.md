---
layout: page
title: "CleanerML Examples"
category: doc
date: 2019-03-11 08:30:00
order: 8
---

**Just some notes to (programming) CleanerML...**

### Pretty 1

**Coding style:**  
We use the coding style that xmllint (Linux Program) use! (More to xmllint at the end of this docu...)

**The coding style is:**  
- Throw in with two spaces;  
- Comments can have multiple lines;  
- Comments are done in new lines;  
- And no empty lines in code!

XML files get in repo later formated/tested with xmllint...

**Additional information:**  
Your cleaners should retain the copyright and information header found in `release/*.xml`. Please edit the copyright information accordingly. If needed, you can also include extra maintenance information in the header, as found in [release/openshot.xml](https://github.com/az0/cleanerml/blob/master/openshot.xml):

    @url http://full.url.of/software-project
    @tested ok softwareversion, OSnameandversion
    @note Some notes for cleaner maintainers

Example for a other version:

    @url http://www.vuze.com/
    @cleanerversion v0.6.0
    @cleanerdate 2019-03-11
    @cleanerby https://github.com/Tobias-B-Besemer
    @tested ok v???, Windows 7
    @testeddate 2019-03-11
    @testedby https://github.com/Tobias-B-Besemer
    @note 

<br>

### Header

The cleaner starts with the `<cleaner>` element.  
Example for a `<cleaner>` header: `<cleaner id="smplayer">`  
`id` is the BleachBit internal ID of the cleaner.

`<cleaner>` can define that the cleaner is OS dependent.  
For more information to this look at: OS dependent parts/cleaners

After that comes `<label>`.  
`<label>` defines the label shown as name (of the cleaner) in the left column of BleachBit.  
Example: `<label>SMPlayer</label>`

`<label>` can have some attributes...

Example: `<label translate="true">Deep Scan - More</label>`  
If the label should be translated by the translators into local.

Example: `<label translators="In Windows 'Run' is the dialog in the Start menu">Run</label>`  
As note for the translators.

And then we need a description of the cleaner (shown on the right side of BleachBit).  
Example of a `<description>` element: `<description>Video player</description>`

With `running` you can prevent that the cleaner gets executed as long a special program is running...  
Example: `<running type="exe" os="windows">firefox.exe</running>`

<br>

### Variables

**A cleaner can have multiple variables**  
You can define one or more variables in a cleaner with `<var>` and `<value>`.

**Example:**  
`<var name="profile">`  
`  <value os="windows">%USERPROFILE%\.smplayer</value>`  
`  <value os="linux">~/.config/smplayer</value>`  
`</var>`

**Explanaition:**  
Defines with `<var>` the variable "profile" that is after that definded with `<value>` for `os="windows"` and `os="linux"`.

<br>

### OS dependent parts/cleaners

**Make a part, or the cleaner OS dependent**  
You can make the cleaner (a part, or the hole cleaner) OS dependent by adding the `os=` attribute.

**Example:**  
`<cleaner id="windows" os="windows">`

**Explanaition:**  
Adding the `os=` attribute in the `<cleaner>` element makes the cleaner OS dependent and boosts load time of BleachBit.  
Version 2.1 of BleachBit adds support for `os=` on the elements `action`, `value`, and `running`.

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

<br>

### Pretty, 2

When you be finished, you can run "Makefile" or "Makefile.bat" to make the code of your XML file pretty.
