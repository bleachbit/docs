---
layout: page
title: "Command Line Interface"
category: doc
date: 2015-09-25 23:27:26
order: 4
---

Most anything you can do with the graphical user interface, you can do with BleachBit's command line interface which serves two needs:

*   Automating cleaning in scripts, batch files, and scheduled tasks
*   Running BleachBit headless in terminal-only connections.

This page includes some examples.

### Microsoft Windows

In Windows, use the executable ```bleachbit_console.exe``` to console output. The executable isn't added automatically to the path, so you use the full path ```C:\Program Files\BleachBit\bleachbit_console.exe```. Where acceptable, it is best to substitute the environment variable ```%ProgramFiles%``` for ```C:\Program Files\```.

### Linux

Running ```bleachbit``` (which is in the path) with arguments runs BleachBit in command line mode. Without arguments, BleachBit runs in graphical mode. The clipboard can only be cleaned under an X session (which is generally not available over SSH or in cron).

### Listing options

To see a list of cleaners and their options, run:

`bleachbit --list`

### Preview

To preview deleting Firefox cache, run:

`bleachbit --preview firefox.cache`

Multiple arguments are allowed. To preview deleting Firefox cache and Opera cache, run:

`bleachbit --preview firefox.cache opera.cache`

Wildcards are allowed for options (though not cleaners), so to preview deleting all of Opera, run:

`bleachbit --preview opera.*`

To select the same options as in the GUI, use ```--preset```, which may be combined with other options:

`bleachbit --preview --preset firefox.cookies`

_--preset requires BleachBit 0.8.7 or later_

### Deleting files

When you are ready to delete files and make other permanent changes, replace ```--preview``` with ```--clean```. To vacuum Firefox, for example, run:

`bleachbit --clean firefox.vacuum`

### Overwriting files

To overwrite the contents of files so they cannot be undeleted later, add ```--overwrite```:

`bleachbit --overwrite --clean firefox.vacuum`

Without ```--overwrite```, BleachBit checks the configuration set in the graphical user interface.

### cron example (Linux)

To vacuum Firefox each night at 03:00, run:

`crontab -e`

and add this line:

`0 3 * * * bleachbit --clean firefox.vacuum`

### Windows Task Scheduler

To vacuum Firefox each night at 03:00:

*   Open the Control Panel.
*   Open Scheduled Tasks.
*   Click **Add Scheduled Task**.
*   Click **Next**.
*   Click **Browse**.
*   Choose ```C:\Program Files\BleachBit\bleachbit_console.exe```.
*   Choose **Daily**.
*   Set the start time.
*   Click **Next**.
*   Click **Next**.
*   Check **Advanced Properties**.
*   At the end of **Run**, add <tt>--clean firefox.vacuum</tt>.
*   Click **OK**.


