---
layout: page
title: "Frequently Asked Questions"
category: doc
date: 2015-09-25 23:30:16
order: 5
---

## FAQ

**Q: Why do I see permissions denied errors on Linux?**  
A: If you are trying to clean the system (localizations, APT, or Yum), run BleachBit with root permissions by choosing the menu option "BleachBit as Administrator" _or_ using <tt>sudo</tt> on the command line.

**Q: Why do I see permission denied errors on Windows?**
This happens when cleaning certain files, such as Windows system logs under ``c:\windows``.
A: When you first launch BleachBit it should prompt you with the User Access Control dialog, which asks, "Do you want to allow the following program to make changes to this computer." Answer *Yes* to grant BleachBit the privileges to modify all files.

**Q: On Linux do I need to run BleachBit both as a normal user and as an administrator?**  
A: It depends how your system elevates privileges. Linux has various tools (for example, kdesudo, gksudo sudo, and su-to-root) with various options to elevate to root (administrator) privileges, and they create basically two different situations.

In the first case, they switch the user to the root account, so BleachBit cleans the root account and not the non-privileged account. For example, BleachBit will clean root's web browsers, which are probably never used. In this case, you will need to run BleachBit again as the non-privileged user.

In the second case, BleachBit runs with elevated privileges in the context of the non-privileged account: this is probably what you want.

To tell the difference, start BleachBit as Administrator, click on Help - System Information, and look at the value for ```os.path.expanduser('~')```. If it equals ```/root```, then the first case is happening, so run BleachBit both as administrator and as a regular user.

Another way to check is first to run BleachBit as administrator. Then run BleachBit as a regular user, and if the preview shows any files, then you may need to run BleachBit as a regular user.

**Q: How many passes does BleachBit make for the overwrite file option (shredding file)?**  
A: See [Shred files and wipe disks](/documentation/shred-files-wipe-disk).

**Q: Why does BleachBit take a long time (more than five minutes) and fill up by hard drive?**  
A: You enabled the option to **System - Free disk space** to wipe free disk space for privacy. This works basically by creating a large, empty file (see [Shred files and wipe disks](/documentation/shred-files-wipe-disk) for more information). When the hard drive is full, the file will be deleted immediately, and there will be no net change in disk space (you will be back where you started). It is generally recommended you disable this option.

**Q: How do I see BleachBit in my own language on Microsoft Windows?**  
A: The language chosen in the installer does not affect the application. Open the Windows Control Panel, click on Regionalization, choose your language under Standards and Formats, and restart BleachBit. _Alternatively_, you can set the [environment variable](http://support.microsoft.com/kb/310519) **LANG** to your [ISO 639-1 language code](http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) (for example, Spanish is ```es```) or locale code (Mexican Spanish is ```es_MX```).


## Things to know

While these may not be asked, they are not common knowledge:

**Q: Should I delete cache?**  
A: Cache generally improves the performance of your computer. For example, browser cache prevents many files (such as pieces of web pages) from being downloaded again. Getting the file from the cache is much faster than downloading it (even with fast bandwidth). Applications (such as web browsers) normally delete the useless parts of cache to prevent it from growing too large and to make room for new, potentially-useful data.

On the other hand, cache contains content you have viewed and can be used to reconstruct some of your browsing history. Especially for applications that you deleted, some cache is ever used. Finally, deleting a large cache saves time and space before making a backup.

**Q: Should I delete cookies?**
A: Cookies are not inherently evil or dangerous. The following statements are *false*:

*   Cookies have many uses besides advertising
*   Cookies cannot infect a computer like a virus
*   Cookies do not cause popup ads.
*   Cookies cannot read arbitrary information from your computer (such as your name, your credit card, or private documents)

Cookies perform useful functions such as maintaining your login information: this saves you the time of logging in again. Many web sites use cookies to make honest improvements such as simplifying confusing navigation. Cookies rarely contain personally identifiable information (such as a name or email address). With a high degree of success (but a greater hassle for the web operator), web sites can still track visitors who have cookies disabled (using unique information such as IP address, user agent, plugins, etc), so disabling cookies may not have the intended effect.

On the other hand, some web sites use tricks (e.g., "evercookie" technology) to resurrect deleted cookies and try to track users between browsers on the same computer. Using another trick, cookies can track visitors between web sites for behavioural ad targeting: for example, once you visited an online camping store, and suddenly every other web site shows you ads for that camping store.

**Q: Is BleachBit "safe"?**  
A: BleachBit identifies and organizes the files you are most likely want to delete. For a few options which are most likely to cause you regret, it shows a popup warning. In that sense, BleachBit is much safer for a novice computer user than poking through the random directories hunting for files to delete. On the other hand, if the saying "One man's trash is another man's treasure" were not true or the saying "one size fits all" applied here, BleachBit would have no options. Carefully read the descriptions and warnings, and do not choose any options you do not understand or which make you uncomfortable.

**Q: Will BleachBit make my computer faster?**  
A: BleachBit probably won't make your computer faster in general, but there are two specific ways you may see your computer become faster. First, by removing excess files, you may see an improvement in the speed of virus scanning and for disk backups. Second, vacuuming SQLite databases speed up applications that use them. Firefox, Safari, and Google Chrome are some of the applications that stores various data, such as URL history, in an SQLite database. With heavy browsing, the databases become fragmented and bloated, and this happens at a level higher than the disk storage, so standard disk defragmentation tools are completely useless. BleachBit shrinks the SQLite database (saving disk space and disk I/O effort) and defragments them. You are most likely to see a dramatic benefit by not vacuuming for a while, using the application heavily, and then vacuuming it once, but to keep the application running quickly, vacuum often. Vacuuming is not a single solution to all performance problems, but it does complement other solutions. People buy faster computers with better CPUs and more RAM, but hard drive technology (other than the rare SSDs) hasn't become much faster than they were years ago. The hard disk is often the bottleneck, and vacuuming is one way to overcome this limitation.

On the other hand, deleting (or disabling) cache may make your computer slower because data will have be re-downloaded or re-generated..



