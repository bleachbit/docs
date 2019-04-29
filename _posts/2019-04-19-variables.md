---
layout: page
title: "Variables"
category: cml
date: 2000-01-01 00:00:00
---

BleachBit supports several kind of variables for use in writing cleaning rules.
It is a best practice to use variables rather than hard-coding paths that vary
across systems. Common paths may change depending on user logged in, the version
of Windows, and on the user's language. For example, the Windows `%ProgramFiles%`
is usually on the `C:` drive, but on some systems it is on the `D:` drive.

Use variables in any part of CleanerML and Winapp2.ini that refers to a file path.

### Home

Write `~` to refer to the user's profile directory. While this is a
Unix convention, BleachBit supports it also on Windows.

Example: `~/.bashrc`


### Environment variables

Use any environment variables defined in the operating system.

On Unix systems, BleachBit supports the styles `$foo$` and `${foo}`.
It is a best practice to use the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables).

Example: `$XDG_CONFIG_HOME/google-chrome`

On Windows, BleachBit supports the Unix-style above and the Windows-style `%foo%`.

Example: `%LocalAppData%\Google\Chrome\User Data`

The most common Windows environment variables are `%AppData%`, `%LocalAppData%`, `%ProgramFiles%`, and `%UserProfile%`. For more information, see Wikipedia's article ["Environment variable"](https://en.wikipedia.org/wiki/Environment_variable).


#### Defined by BleachBit

In addition to the environment variables defined by the operating system,
BleachBit defines enviroment variables for convenience and compatability.

##### Linux
On Linux, these variables are defined if they do not exist:

* `XDG_DATA_HOME`: typically `~/.local/share`
* `XDG_CONFIG_HOME`: typically `~/.config`
* `XDG_CACHE_HOME`: typically `~/.cache`

##### Windows
On Windows, the following are defined if they do not exist:

* `cd`: current directory
* `CommonAppData`
* `Documents`
* `LocalAppData`
* `LocalAppDataLow`
* `Music`
* `Pictures`
* `Video`

The variable `%ProgramFiles%` can behave in an unexpected way because 64-bit
Windows will modify it for 32-bit applications, and BleachBit is a 32-bit
application. To refer to the 64-bit folder on 64-bit Windows, use `%ProgramW6432%`
instead. For more information, see Microsoft's article ["WOW64 Implementation Details"](https://docs.microsoft.com/en-us/windows/desktop/winprog64/wow64-implementation-details).

For compatibility with Winapp2.ini, BleachBit expands `%ProgramFiles%` to
`%ProgramW6432%` as if both were written. Likewise, BleachBit expands
`%CommonProgramFiles%` to `%CommonProgramW6432%`. This expansion is not
supported in CleanerML.

#### Multi-value variables

BleachBit 2.2 introduces to CleanerML a feature called multi-value variables. Within each cleaner, a variable can be defined with multiple values. This greatly simplifies the development and maintenance of cleaners with path variations for operating system and for application derivatives such as Google Chrome and Chromium.

The syntax to use a multi-value variable is `$$foo$$` on both Linux and Windows. Multi-value variable names are case-sensitive, and values can contain environment variables. See the Adobe Flash cleaner (`flash.xml`) for a basic example.

BleachBit 3.0 introduces default variables on Windows

* `$$ProgramFiles$$` expands to both `%ProgramFiles%` and `%ProgramW6432%`
* `$$CommonProgramFiles$$` expands both `%CommonProgramFiles%` and `%CommonProgramW6432%`


