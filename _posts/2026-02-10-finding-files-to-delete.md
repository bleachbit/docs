---
layout: page
title: "Finding files to delete"
category: cml
date: 2026-02-10 00:00:00
order: 2
---

There are various methods to find files to delete, and here are some tips to get you started.

## Exercise the application

After a fresh installation, an application may not have created any data we want to delete, so
run the application first. Here are some tips to get you started:

### General tips

- **Turn on all features**: Explore the menu, settings, documentation, command line options,
and environment variables. Turn on features that record data, and disable features that prevent data recording.
- **Enable logging**: In the application's preferences, turn on all logging (if applicable).
For example, by default, Pidgin turns off chat logs.
- **Exercise all features**: Use the application to generate as many kinds of files as possible.
For example, in Nexuiz (a game), you must play a multiplayer game with a new map to cause
the game to download the map into its cache. Many Nexuiz multiplayer games don't download
maps by default.

### Exercising browsers

So that it records various kinds of data, exercise the web browser:

- In the browser settings, enable features that may record data (e.g., enhanced safe browsing,
third party cookies, profile sync, continue where you left off).
- Disable all ad blockers (e.g., browser extension, DNS, firewall).
- Visit popular sites that use trackers or show ads, such as Google, Facebook, and YouTube.
- Fill out a form to record autofill data.
- Save a password.
- Install a browser extension.
- Download a file.
- Save permissions for a site (e.g., always allow location).
- View a page that uses WebGL ([examples](https://developer.mozilla.org/en-US/docs/Web/API/WebGL_API/By_example)).
- View a page that uses WebGPU ([examples](https://webkit.org/demos/webgpu/)).
- Play an HTML video ([example](https://videojs.org/)).
- Install a PWA web application ([example](https://whatpwacando.today/)).
- In Chromium-based browsers, run with --enable-logging and then visit
chrome://crash to force a crash.

## The usual suspects

General standard locations for a user's application data:

- Linux applications: `~/.config/` or `~/.local/share/`.
- Windows applications: `%APPDATA%` or `%LOCALAPPDATA%`.
- macOS applications: `~/Library/` directories such as for cache, cookies, and preferences.
- Installed via Snap: `~/snap/[application]/` and `~/snap/[application]/common/`.
- Installed via Flatpak: `~/.var/app/[application-id]/`.

Look at existing cleaners for similar applications. This works especially well for browsers based on Firefox and Chromium.

## Check the application's interface

An application may explicitly tell you where it stores its data. For example:

On Chromium-based browsers, visit `chrome://version/` to see the profile directory.

In Firefox-based browsers, visit `about:support` to see the profile directory.

In LibreOffice, click **Tools** > **Options** > **LibreOffice** > **Paths**.

## Find the data directory by application name

If an application does not explicitly tell you where it stores its data, or
in case you suspect it stores data in other locations, you can discover where
the application stores its files. For example, for Firefox, you could use the
following commands to find its files:

- **Linux**: `find ~ -maxdepth 2 -iname "*firefox*" 2>/dev/null`
- **Windows PowerShell**: `Get-ChildItem -Path $env:USERPROFILE -Recurse -Filter "*firefox*" -ErrorAction SilentlyContinue`
- **Windows Command Prompt**: `dir /s /b %USERPROFILE% | findstr /i firefox`

## Search for a string

Sometimes it is helpful to search for a string that appears in the files you want to delete.
1. Visit TikTok in Google Chrome and interact with the site (e.g., watch a video).
2. Use BleachBit to clean all of Google Chrome.
3. Close Google Chrome.
4. Look for any remaining files related to TikTok.

```bash
grep -RiPl "tiktok|byteoversea|tiktokcdn" ~/.config/google-chrome 2>/dev/null
```

Or on Windows:

```powershell
Get-ChildItem -Path "$env:LOCALAPPDATA\Google\Chrome" -Recurse -Filter "*tiktok*" -ErrorAction SilentlyContinue
```

## Trace the process

In some cases, not all files appear using the standard search commands. Perhaps the application
checks for a file that doesn't often exist, or it writes a file but deletes it a moment later.
In these cases, use `strace` (for Linux) or
[Process Monitor](https://learn.microsoft.com/en-us/sysinternals/downloads/procmon) (for Windows)
to find these files.

### Using strace (Linux)

A standard invocation of `strace` (assuming you are launching Firefox) is:

```sh
strace -f -e trace=open,stat,access,mkdir,unlink,rename,readlink firefox 2>&1 | tee /tmp/firefox.log
grep -iE "(cache|log|tmp|$HOME)" /tmp/firefox.log | sort | uniq
```

### Using inotifywait (Linux)

Use `inotifywait` to find files created by an application in real-time, which is
helpful for correlating file creation with application behavior. A standard invocation
(assuming you are launching Chromium installed via snap) is:

```sh
sudo apt install inotify-tools
# Warning: this deletes all data in the test directory
PROFILE_DIR=~/snap/chromium/common/test-profile
mkdir -p "$PROFILE_DIR" # create directory, in case it does not exist
find "$PROFILE_DIR" -mindepth 1 -delete # wipe contents, in case it did exist
inotifywait -m -r "$PROFILE_DIR" -e create --format '%w%f' &
chromium-browser --user-data-dir="$PROFILE_DIR" --enable-logging --log-level=0 --enable-crash-reporter
```


## Windows registry

Search for registry entries in Windows. Typically, they are under:
`HKEY_CURRENT_USER\Software\(app name)`

You can also search using PowerShell:

```powershell
Get-ChildItem -Path HKCU:\Software | Where-Object { $_.Name -match "firefox" }
```

Additional registry locations to check:
- `HKEY_LOCAL_MACHINE\SOFTWARE\[Application Name]`
- `HKEY_CLASSES_ROOT\[Application Extensions]`
