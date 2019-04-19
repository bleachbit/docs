---
layout: page
title: "CleanerML Version 2.0 Documentation"
category: doc
date: 2019-04-19 15:30:00
order: 8
---

<H1>CleanerML Version 2.0 Documentation</H1>

<br>

### Content of the chapter

[1.00 **General**](#1.00-General)  
[1.01 Be pretty](#1.01-Be-pretty)  
[1.02 Python & "glob" (Unix style pathname pattern expansion)](#1.02-Python-&-"glob"-(Unix-style-pathname-pattern-expansion))  
[1.03 Environment Variables]  
[1.04 Example Cleaner]  
[2.00 **Header**]  
[2.01 First Line]  
[2.02 Copyright & Additional Information]  
[2.03 Cleaner Element & ID]  
[3.00 **General Structure & Configurations per Cleaner**]  
[3.01 Label Element]  
[3.02 Description Element]  
[3.03 Option Element]  
[3.04 More pretty (label, option & description)]  
[3.05 Running Element]  
[3.06 OS dependent parts/Cleaners]  
[3.07 Display a Warning]  
[3.08 Define Variables]  
[4.00 **command="delete"**]  
[4.01 command="delete" search="file"]  
[4.02 command="delete" search="folder"]  
[4.03 command="delete" search="walk.files"]  
[4.04 command="delete" search="walk.all"]  
[4.05 command="delete" search="glob"]  
[4.06 Delete the content of a folder and the folder itself]  
[4.07 Delete the content of a folder but not the folder itself]  
[4.08 Delete recursive]  
[4.09 Summary - Table with deletion use cases]  
[4.10 command="delete" search="deep"]  
[5.00 **Other Commands**]  
[5.01 command="winreg"]  
[5.02 Cleaning a Windows Registry Key/Path with a wildcard]  
[5.03 command="ini"]  
[5.04 command="sqlite.vacuum"]  
[5.05 command="json" search="file"]  
[5.06 Run an external program]  
[6.00 **When done**]  
[6.01 Pretty, 2]

<br>

<H1>1.00 General</H1>

<br>

### 1.01 Be pretty

**Coding style:**  
We use the coding style that xmllint (Linux Program) use! (More to xmllint at the end of this docu...)

**The coding style is:**  
- Throw in with two spaces;  
- Comments can have multiple lines;  
- Comments are done in new lines;  
- And no empty lines in code!
- Cleaner and option IDs are written in small letters;
- Underscore is the conventonal delimiter rather than a dash.

XML files get in repo later formated/tested with xmllint...

<br>

### 1.02 Python & "glob" (Unix style pathname pattern expansion)

According to https://docs.python.org/3/library/glob.html:
The `glob` module finds all the pathnames matching a specified pattern according to the rules used by the Unix shell, [...].
No tilde expansion is done, but `*`, `?`, and character ranges expressed with `[]` will be correctly matched. [...]
Note that [...] glob treats filenames beginning with a dot (`.`) as special cases. [...]  
For a literal match, wrap the meta-characters in brackets. For example, `'[?]'` matches the character `'?'`.  

And now the same a bit more simple:  
In *NIX Systems (Linux, Unix, BSD, Darvin, ...) paths and file names can contain special characters like `*` and `?`.  
To use now wildcard or interrogation mark for a Windows-like search, we have to use in this cases `glob`!  
In the following there will be here and there some cases & examples in the documenation, where `glob` must be used!

<br>

### 1.03 Environment Variables

**Use a Environment Variables to have the path relative**  
You can use a Environment Variables (you should!) to have the path relative!

Read more:  
https://docs.bleachbit.org/doc/cleanerml.html  

BleachBit allows all the normal operating system variables, and it adds some extras.  
Read about the normal operating system variables:  
https://en.wikipedia.org/wiki/Environment_variable  
https://en.wikipedia.org/wiki/Environment_variable#Default_values

Special:  
Windows itself changes %ProgramFiles% for 32-bit processes running in a 64-bit operating system as documented here:  
https://docs.microsoft.com/en-us/windows/desktop/winprog64/wow64-implementation-details  
Means, BleachBit shows in "Help - System Information" on 686/x64 systems:  
os.getenv('ProgramFiles') = C:\Program Files (x86)  
os.getenv('ProgramW6432') = C:\Program Files  
...and not:  
os.getenv('ProgramFiles') = C:\Program Files  
os.getenv('ProgramW6432') = C:\Program Files

<br>

### 1.04 Example Cleaner

Here is an example cleaner:  
https://github.com/bleachbit/bleachbit/blob/master/doc/example_cleaner.xml

<br>

<H1>2.00 Header</H1>

<br>

### 2.01 First Line

The first line in a new cleaner file is always `<?xml version="1.0" encoding="UTF-8"?>`.  
This identifies the file as a XML file.  
CleanerML files are a special version of XML files.

<br>

### 2.02 Copyright & Additional Information

Your cleaners should retain the copyright and information header found in `release/*.xml`. Please edit the copyright information accordingly.  
If needed, you can also include extra maintenance information in the header, as found in [release/openshot.xml](https://github.com/az0/cleanerml/blob/master/openshot.xml):

    @url http://full.url.of/software-project
    @tested ok softwareversion, OSnameandversion
    @note Some notes for cleaner maintainers

**Example for a other version:**

    @app Double Commander
    @url https://doublecmd.sourceforge.io/
    @os Windows, Linux, FreeBSD
    @cleanerversion v0.2.5
    @cleanerdate 2019-03-11
    @cleanerby https://github.com/Tobias-B-Besemer
    @tested ok v0.8.4, Windows 7
    @testeddate 2019-03-11
    @testedby https://github.com/Tobias-B-Besemer
    @note As long we have no command="xml", we need to delete the complete file!

<br>

### 2.03 Cleaner Element & ID

The cleaner starts with the `<cleaner>` element.  
Example for a `<cleaner>` header: `<cleaner id="smplayer">`  
`id` is the BleachBit internal ID of the cleaner.

`<cleaner>` can define that the cleaner is OS dependent.  
For more information to this look at: OS dependent parts/cleaners

<br>

<H1>3.00 General Structure & Configurations per Cleaner</H1>

<br>

### 3.01 Label Element

After that comes `<label>`.  
`<label>` defines the label shown as name (of the cleaner) in the left column of BleachBit.  
Example: `<label>SMPlayer</label>`

`<label>` can have some attributes...

Example: `<label translate="true">Deep Scan - More</label>`  
If the label should be translated by the translators into local.

Example: `<label translators="In Windows 'Run' is the dialog in the Start menu">Run</label>`  
As note for the translators.

<br>

### 3.02 Description Element

And then we need a description of the cleaner (this time a category!) (shown on the right side of BleachBit).  
Example of a `<description>` element: `<description>Video player</description>`

<br>

### 3.03 Option Element

Then comes the first `<option>` and then for the `<option>` a `<label>` and a `<description>` (this time a explanaition!), again.  
Example:  
`<cleaner id="tomtom" os="windows">`  
`  <label>TomTom</label>`  
`  <description>Navigation systems</description>`  
`  <option id="cookies">`  
`    <label>Cookies</label>`  
`    <description>Delete cookies, which contain information such as web site preferences, authentication, and tracking identification</description>`

<br>

### 3.04 More pretty (label, option & description)

Please use (if possible) terms for `<label>`s of `<option>`s and `<description>`s (for `<cleaner>` and `<option>`), that are already used somewhere else in the program!
This makes translation easier, because the term can be maybe be already translated! E.g. don't use "Temp files" or "Temporary Files", use "Temporary files"! (Yes, it is case sensetive!)  
Example:  
`<label>Temporary files</label>`  
`<description>Delete the temporary files</description>`

Use the writing/naming form, that is used by the other cleaners/options, too!  
Example: Don't write "Junk Files", use "Junk files"! (Yes, it is case sensetive!)

We make no dot at the end of `<description>`!

<br>

### 3.05 Running Element

With `running type="exe"` you can prevent that the cleaner gets executed as long a special program/task is running...  
Example: `<running type="exe" os="windows">firefox.exe</running>`

With `running type="pathname"` you can also prevent that the cleaner gets executed, but as long as a special file exist!  
Example: `<running type="pathname">~/.mozilla/firefox/*.default/lock</running>`

Generally it is preffered to have this exe/pathname check included in cleaners!  
And generally the `exe` variation is preffered over the `pathname` variation!

<br>

### 3.06 OS dependent parts/Cleaners

**Make a part, or the cleaner OS dependent**  
You can make the cleaner (a part, or the hole cleaner) OS dependent by adding the `os=` attribute.

**Example:**  
`<cleaner id="windows" os="windows">`

**Explanaition:**  
Adding the `os=` attribute in the `<cleaner>` element makes the cleaner OS dependent and boosts load time of BleachBit.  
Version 2.1 of BleachBit adds support for `os=` on the elements `action`, `value`, and `running`.  
For `os` can be used `windows`, `linux`, `FreeBSD`, `NetBSD`, `OpenBSD` & `unix`. While `os="unix"` includes Linux, the three BSD systems, and Darwin.

<br>

### 3.07 Display a Warning

**Display a warning to the user**  
Displays a warning to the user if the cleaner gets selected in BleachBit.

**Example:**  
`<warning>Use the option only if you know what you do!</warning>`

**Explanaition:**  
`<warning>` gets used inside the `<option>` section, on top, as first rule.

<br>

### 3.08 Define Variables

**A cleaner can have multiple variables**  
You can define one or more variables in a cleaner with `<var>` and `<value>`.

**Example:**  
`<var name="profile">`  
`  <value os="windows">%USERPROFILE%\.smplayer</value>`  
`  <value os="linux">~/.config/smplayer</value>`  
`</var>`

**Explanaition:**  
Defines with `<var>` the variable "profile" that is after that definded with `<value>` for `os="windows"` and `os="linux"`.

**Example with two values for one OS:**  
`<var name="profile">  
`  <value os="windows">%LocalAppData%\Google\Chrome\User Data\Default</value>`  
`  <value os="linux">$XDG_CONFIG_HOME/google-chrome/Default</value>`  
`  <value os="linux">$XDG_CONFIG_HOME/google-chrome-beta/Default</value>`  
`</var>`

**Example for a value, when the path includes a "*":**  
`<value search="glob" os="windows">%AppData%\Mozilla\Firefox\Profiles\*</value>`

<br>

<H1>4.00 command="delete"</H1>

<br>

### 4.01 command="delete" search="file"

**Deleting a single file/or an empty folder**  
Deletes a single file or an empty folder in the file system.

**Example:**  
`<action command="delete" search="file" path="$APPDATA\XnView\XnView.db"`

**Explanaition:**  
`command` is always `"delete"`, `search` is always `"file"`, `path` is the path & name of the file to delete.

`<action command="delete" search="file" path="%ProgramFiles%\BiglyBT\*.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="file" path="%ProgramFiles%\BiglyBT*\test.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

<br>

### 4.02 command="delete" search="folder"

**Deleting a single folder**  
Deletes a single folder in the file system. This feature is planed and not yet implemented!

**Example:**  
`<action command="delete" search="folder" path="%Temp%\DemoFolder\"`

**Explanaition:**  
`command` is always `"delete"`, `search` is always `"folder"`, `path` is the path & name of the file to delete.

**Not sure if `<action command="delete" search="folder" path="%ProgramFiles%\BiglyBT*\"/>` will work!**  
**Not sure if `<action command="delete" search="folder" path="%ProgramFiles%\BiglyBT*\"/>` will work when the folder is not empty!**  

<br>

### 4.03 command="delete" search="walk.files"

**Follows**  
Follows

**Example:**  
Follows

**Explanaition:**  
Follows

`<action command="delete" search="walk.files" path="%ProgramFiles%\BiglyBT\*.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="walk.files" path="%ProgramFiles%\BiglyBT*\test.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="walk.files" path="%ProgramData%\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\*"/>`  
**Doesn't work! No `*` at the end allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="walk.files" path="%AppData%\Daum\PotPlayer\Log\*"/>`  
If you mean every directory under %AppData%\Daum\PotPlayer\Log\, then walk.files is right, but if you want every file then you want either `search="glob"` (which will not delete recursively) OR remove the wildcard (which will delete recursively)!

<br>

### 4.04 command="delete" search="walk.all"

**Follows**  
Delete e.g. the content of a folder.

**Example:**  
Follows

**Explanaition:**  
Follows ... walk.all is intended to match directories, not files.

If you add a "*" at the end of a path by `walk.all`, the content of the folder doesn't get deleted!  
`<action command="delete" search="walk.all" path="%windir%\Temp\*"/>`
Explanaition: The "*" is a wildcard for a folder - so the content in the subfolders get deleted!

And this doesn't work, too.  
`<action command="delete" search="walk.all" path="%windir%\Temp\WER*.hdmp"/>`  
Use `glob` instead:  
`<action command="delete" search="glob" path="%windir%\Temp\WER*.hdmp"/>`

This also doesn't work!  
`<action command="delete" search="walk.all" path="%windir%\Temp*\WER1.hdmp"/>`  
Use `glob` instead:  
`<action command="delete" search="glob" path="%windir%\Temp*\WER1.hdmp"/>`

<br>

### 4.05 command="delete" search="glob"

**Follows**  
Needed if you e.g. use a wildcard (`*`)!

**Example:**  
`<action command="delete" search="glob" path="%windir%\Temp\WER*.hdmp"/>`

**Explanaition:**  
Follows ... and don't go into the subfolders.

Other example:  
`<action command="delete" search="glob" path="%windir%\Temp*\WER1.hdmp"/>`  
There is also a wildcard used!

More to "glob": https://docs.python.org/2/library/glob.html

<br>

### 4.06 Delete the content of a folder and the folder itself

**You can delete the content of a folder and the folder itself**  
Follows

**Example:**  
`<action command="delete" search="walk.all" path="$LocalAppData\Temp\acrord32_sbx"/>`  
`<action command="delete" search="file" path="$LocalAppData\Temp\acrord32_sbx"/>`

**Explanaition:**  
`walk.all` deletes the content of the folder and shows it in BleachBit, while `file` deletes after that the empty folder itself.

<br>

### 4.07 Delete the content of a folder but not the folder itself

**You can delete the content of a folder and not the folder itself**  
Follows

**Example:**  
`<action command="delete" search="walk.all" path="$LocalAppData\Temp\acrord32_sbx"/>`  
`<action command="delete" search="glob" path="$LocalAppData\Temp\acrord32_sbx\*"/>`

**Explanaition:**  
`walk.all` deletes the content of the folder and shows it in BleachBit, while `glob` with a `\` at the end of `path` deletes the folders in the folder.

<br>

### 4.08 Delete recursive

**Follows**  
Follows

**Example:**  
`<action command="delete" search="walk.files" path="$$profile$$\" regex="\.[Bb][Aa][Kk]$"/>`

**Explanaition:**  
Follows

**More examples:**  
`regex="\.[Bb][Aa][Kk]$"` -> File Extension, not key sensetive  
`regex="^Thumbs\.db$"` -> Exact file name  
`regex="^`[...] -> File name starts with  
`regex="\.`[...] -> File extension is  

<br>

### 4.09 Summary - Table with deletion use cases

**Delete Files:**

| Single file? | Recursive? | "*"/"?" used in path or filename? | Use: |
| --- | --- | --- | --- |
| Yes | - | No | search="file" |
| Yes | - | Yes | search="glob" |
| No | No | Path=No | search="glob" |
| No | No | Path=Yes | search="glob" |
| No | Yes | Path=No | search="walk.files" with regex="[...]" |
| No | Yes | Path=Yes | search="walk.files" with regex="[...]" |

<br>

**Delete Folders:**

| What to delete? | "*"/"?" used in path or folder-name? | Use: |
| --- | --- | --- |
| Folder content, recursive, without sub-folders (structure) | No | search="walk.files" |
| Folder content, recursive, without sub-folders (structure) | Yes | search="walk.files" |
| Folder content, recursive, with sub-folders (structure) | No | search="walk.all" |
| Folder content, recursive, with sub-folders (structure) | Yes | search="walk.all" |
| Folder content, not recursive, without sub-folders | No | search="glob" |
| Folder content, not recursive, without sub-folders | Yes | search="glob" |
| Folder empty | No | search="file" |
| Folder empty | Yes | search="glob" |
| Folder not empty | No | search="folder" (*1) |
| Folder not empty | No | search="walk.all" and the search="file" |
| Folder not empty | Yes | search="folder" (*1) |
| Folder not empty | Yes | search="walk.all" and then search="glob" |

*1: Not yet implemented!

<br>

### 4.10 command="delete" search="deep"

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

<H1>5.00 Other Commands</H1>

<br>

### 5.01 command="winreg"

**Cleaning a Windows Registry Key/Path**  
Deletes in the `path` (tree in Regedit) a "folder", or a key.

**Example:**  
`<action command="winreg" path="HKCU\Software\Adobe\Acrobat Reader\5.0\AVGeneral\cRecentFiles" name="StoreLocation"/>`

**Explanaition:**  
`command` is always `"winreg"`, `path` is the path/tree/folder, `name` is the key that gets delete.  
If you don't add a `name` to it, the `path` gets deleted!

**More examples:**  
`<action command="winreg" path="HKCU\Software\Adobe\Acrobat Reader\5.0\AVGeneral\cRecent*" name="StoreLocation"/>`  
...and...  
`<action command="winreg" path="HKCU\Software\Adobe\Acrobat Reader\*\AVGeneral\cRecentFiles" name="StoreLocation"/>`  
**...doesn't work! No wildcards allowed (, yet)!**  

<br>

### 5.02 Cleaning a Windows Registry Key/Path with a wildcard

**You can cleaning a Windows Registry Key/Path with a wildcard**  
Deletes in the `path` (tree in Regedit) a "folder", or a key with a wildcard.

**Example:**  
`<action command="winreg" path="HKCU\Software\XnView\Start\FileName_*" />`

**Explanaition:**  
`command` is always `"winreg"`, `path` is the path/tree/folder/key you want to delete, "*" match any string that will be find.

<br>

### 5.03 command="ini"

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

### 5.04 command="sqlite.vacuum"

**Follows**  
Follows

**Example:**  
`<action command="sqlite.vacuum" search="file" path="$$profile$$/Sync Data/SyncData.sqlite3"/>`

**Explanaition:**  
Follows

**More examples:**  
`<action command="sqlite.vacuum" search="glob" path="$$profile$$/History Index ????-??"/>`

<br>

### 5.05 command="json" search="file"

**Follows**  
Follows

**Example:**  
`<action command="json" search="file" path="$$profile$$/Preferences" address="dns_prefetching/host_referral_list"/>`

**Explanaition:**  
Follows

<br>

### 5.06 Run an external program

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

<H1>6.00 When done</H1>

<br>

### 6.01 Pretty, 2

When you be finished, you can run "Makefile" or "Makefile.bat" to make the code of your XML file pretty.