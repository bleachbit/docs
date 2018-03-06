---
layout: page
title: "Preferences"
category: doc
date: 2015-09-25 23:17:25
order: 2
---

BleachBit provides preferences (also called options or settings) which change how it works. To edit the preferences, click **Edit** - **Preferences**.

### Check periodically for updates via the Internet

When enabled, BleachBit checks for updates. If an update is found, a notification button appears. Click the button to read about the changes and download the new version. The new version is _not_ downloaded automatically.

### Hide irrelevant cleaners

Enabling this option reduces clutter at the cost of a slightly longer startup.

BleachBit determines whether a cleaner is relevant two ways: first, it checks whether there is anything to clean. For example, it only checks that Firefox has cache, but it doesn't check whether Firefox is installed. (This works well for applications you used once and then deleted.) Second, BleachBit checks whether the cleaner was already enabled: enabled cleaners are not hidden.

### Overwrite files to hide contents

When files are deleted normally, the operating system only deletes the _reference_ to the file (not the _contents_), but later file can usually be undeleted. To securely delete files marked for cleaning (such as Firefox cache) to prevent this kind of recovery, enable overwriting files (also called file shredding).

Overwriting files is significantly slower than deleting files normally. Overwriting is supported for standard file deletions (such as deleting Firefox cache) and when deleting Firefox URL history (a special operation), but it is not supported for other special operations (such as deleting locked files in Windows). Overwriting is not effective in some situations such as with NTFS compression and the ext3 filesystem in data=journal mode. Neither of these two example situations are common.

To complement the limitations of overwriting individual files, use the **Free disk space** option under **System** to overwrite free disk space and hide previously deleted files.

### Drives

Before using the **Free disk space** option under **System**, select a writable directory for each drive (also called logical partition or mount point). The unallocated disk space in the chosen drives will be wiped.

When starting for the first time, BleachBit tries to guess the correct value. In Linux, a good setting is typically <tt>/home/(username)</tt> and <tt>/tmp</tt>, but only one should be used if both are on the same partition. In Windows, typically <tt>C:\\</tt> is a good choice.

### Languages

Select all languages you wish to keep. If your native language is Klingon, select Klingon. Locale files for unchecked languages will be deleted when cleaning **Localizations** under **System**.

This option is not available in Windows.


