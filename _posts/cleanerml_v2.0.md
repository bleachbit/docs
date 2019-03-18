---
layout: page
title: "CleanerML Version 2.0 Documentation"
category: doc
date: 2019-03-18 11:30:00
order: 8
---

**CleanerML Version 2.0 Documentation**

### Example Cleaner

Here is an example cleaner:  
https://github.com/bleachbit/bleachbit/blob/master/doc/example_cleaner.xml

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

And then we need a description of the cleaner (this time a category!) (shown on the right side of BleachBit).  
Example of a `<description>` element: `<description>Video player</description>`

Then comes the first `<option>` and then for the `<option>` a `<label>` and a `<description>` (this time a explanaition!), again.  
Example:  
`<cleaner id="tomtom" os="windows">  
  <label>TomTom</label>  
  <description>Navigation systems</description>  
  <option id="cookies">  
    <label>Cookies</label>  
    <description>Delete cookies, which contain information such as web site preferences, authentication, and tracking identification</description>`


Please use (if possible) terms for `<label>`s of `<option>`s and `<description>`s (for `<cleaner>` and `<option>`), that are already used somewhere else in the program! This makes translation easier, because the term can be maybe be already translated!  
E.g. don't use "Temp files" or "Temporary Files", use "Temporary files"! (Yes, it is case sensetive!)  
Example:  
`<label>Temporary files</label>`  
`<description>Delete the temporary files</description>`

Use the writing/naming form, that is used by the other cleaners/options, too!  
Example: Don't write "Junk Files", use "Junk files"! (Yes, it is case sensetive!)

We make no dot at the end of `<description>`!

With `running type="exe"` you can prevent that the cleaner gets executed as long a special program/task is running...  
Example: `<running type="exe" os="windows">firefox.exe</running>`

With `running type="pathname"` you can also prevent that the cleaner gets executed, but as long as a special file exist!  
Example: `<running type="pathname">~/.mozilla/firefox/*.default/lock</running>`

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

### Environment Variables

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

**Example with two values for one OS:**  
`<var name="profile">  
`  <value os="windows">%LocalAppData%\Google\Chrome\User Data\Default</value>`  
`  <value os="linux">$XDG_CONFIG_HOME/google-chrome/Default</value>`  
`  <value os="linux">$XDG_CONFIG_HOME/google-chrome-beta/Default</value>`  
`</var>`

**Example for a value, when the path includes a "*":**  
`<value search="glob" os="windows">%AppData%\Mozilla\Firefox\Profiles\*</value>`

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

### command="delete" search="folder"

**Deleting a single folder**  
Deletes a single folder in the file system. This feature is planed and not yet implemented!

**Example:**  
`<action command="delete" search="folder" path="%Temp%\DemoFolder\"`

**Explanaition:**  
`command` is always `"delete"`, `search` is always `"folder"`, `path` is the path & name of the file to delete.

**Not sure if `<action command="delete" search="folder" path="%ProgramFiles%\BiglyBT*\"/>` will work!**  
**Not sure if `<action command="delete" search="folder" path="%ProgramFiles%\BiglyBT*\"/>` will work when the folder is not empty!**  

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

`<action command="delete" search="walk.files" path="%ProgramFiles%\BiglyBT*\test.log"/>`  
**Doesn't work! No wildcards allowed (, yet)!**  
**Use `glob`!**  

`<action command="delete" search="walk.files" path="%ProgramData%\Microsoft\Search\Data\Applications\Windows\GatherLogs\SystemIndex\*"/>`  
**Doesn't work! No `*` at the end allowed (, yet)!**  
**Use `glob`!**  

<br>

### command="delete" search="walk.all"

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

### command="delete" search="glob"

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

### Delete the content of a folder and the folder itself

**You can delete the content of a folder and the folder itself**  
Follows

**Example:**  
`<action command="delete" search="walk.all" path="$LocalAppData\Temp\acrord32_sbx"/>`  
`<action command="delete" search="file" path="$LocalAppData\Temp\acrord32_sbx"/>`

**Explanaition:**  
`walk.all` deletes the content of the folder and shows it in BleachBit, while `file` deletes after that the empty folder itself.

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

### Delete recursive

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

### command="json" search="file"

**Follows**  
Follows

**Example:**  
`<action command="json" search="file" path="$$profile$$/Preferences" address="dns_prefetching/host_referral_list"/>`

**Explanaition:**  
Follows

<br>

### command="sqlite.vacuum"

**Follows**  
Follows

**Example:**  
`<action command="sqlite.vacuum" search="file" path="$$profile$$/Sync Data/SyncData.sqlite3"/>`

**Explanaition:**  
Follows

**More examples:**  
`<action command="sqlite.vacuum" search="glob" path="$$profile$$/History Index ????-??"/>`

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
