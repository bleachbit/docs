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

### Video

This video introduces the command line interface for Microsoft Windows.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Tdn81MXqcZo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

### Microsoft Windows

In Windows, use the executable `bleachbit_console.exe` to console output. The directory isn't added automatically to the path, so you use the full path `C:\Program Files (x86)\BleachBit\bleachbit_console.exe`. Where acceptable, it is best to substitute the environment variable `%ProgramFiles(x86)%` for `C:\Program Files (x86)\`.

### Linux

Running `bleachbit` (which is in the path) with arguments runs BleachBit in command line mode. Without arguments, BleachBit runs in graphical mode. The clipboard can only be cleaned under an X session (which is generally not available over SSH or in cron).

### Listing options

To see a list of cleaners and their options, run:

`bleachbit --list`

### Preview

To preview deleting Firefox cache, run:

`bleachbit --preview firefox.cache`

Multiple arguments are allowed. To preview deleting Firefox cache and Opera cache, run:

`bleachbit --preview firefox.cache opera.cache`

Wildcards are allowed for options (though not cleaners), so to preview deleting all options for Opera, run:

`bleachbit --preview opera.*`

To select the same options as in the GUI, use ```--preset```, which may be combined with other options:

`bleachbit --preview --preset firefox.cookies`


### Deleting files

When you are ready to delete files and make other permanent changes, replace ```--preview``` with ```--clean```. To vacuum Firefox, for example, run:

`bleachbit --clean firefox.vacuum`

### Overwriting files

To overwrite the contents of files, so they cannot be undeleted later, add ```--overwrite```:

`bleachbit --overwrite --clean firefox.vacuum`

Without ```--overwrite```, BleachBit checks the configuration set in the graphical user interface.

### Shredding files

To shred any file, so its contents cannot be recovered, use `--shred`. While `--overwrite` refers to the files identified by `--clean`, the option `--shred` shreds any file anywhere. For example, this shreds one file named `yoga_emails.txt`:

`bleachbit --shred ~/yoga_email.txt`

To shred all files under a directory, pass the name of the directory like this:

`bleachbit --shred "C:\Microsoft Exchange\Top Secret Emails\"`


### Wiping free space

When files are [deleted without shredding](shred-files-and-wipe-disks.html), the contents might be recoverable from the disk's free space. To prevent recovery from free space, you can wipe the free space. Unlike wiping specific files, wiping free space takes a long time.

You might want to wipe free space for each logical drive. For example, on Windows you might wipe `C:` and `D:`, if you have both and write sensitive files to them both. On Linux, you might want to wipe `/` and `/home` if they are separate partitions and if you write sensitive information to both.

To wipe any partition, pass any writable directory in that partition to `--wipe-free-space`. For example:

`bleachbit --wipe-free-space ~/.cache/`

Wiping free space does not change how much free space is left, when the process is done. For example, if you start with 10GB free, then you will still have 10GB free when the process is done.


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
*   Choose ```C:\Program Files (x86)\BleachBit\bleachbit_console.exe```.
*   Choose **Daily**.
*   Set the start time.
*   Click **Next**.
*   Click **Next**.
*   Check **Advanced Properties**.
*   At the end of **Run**, add <tt>--clean firefox.vacuum</tt>.
*   Click **OK**.


