---
layout: page
title: "Frequently Asked Questions"
category: doc
date: 2000-01-25 23:30:16
order: 5
---

### Question: Why do I see permissions denied errors on Linux?

Answer: If you are trying to clean the system (for example, localizations, APT, or DNF), run BleachBit with root permissions. To elevate permissions, choose the menu option "BleachBit as Administrator" _or_ run <tt>sudo</tt> on the command line.

Alternatively, when running as a normal user, uncheck options that require root permissions.

### Q: Why do I see permission denied errors on Windows?
This happens when cleaning certain files, such as Windows system logs under ``c:\windows``.
A: When you first launch BleachBit it should prompt you with the User Access Control dialog, which asks, "Do you want to allow the following program to make changes to this computer." Answer *Yes* to grant BleachBit the privileges to modify all files.

If you answer *No*, then BleachBit will start, and it will still be able to clean data under your user profile. However, it will not have access to clean system data.

### Q: On Linux do I need to run BleachBit both as a normal user and as an administrator?
A: It depends how your system elevates privileges. Linux has various tools (for example, kdesudo, gksudo sudo, su-to-root, and PolicyKit) with various options to elevate to root (administrator) privileges, and they create two different situations.

In the first case, they switch the user to the root account, so BleachBit cleans the root account and not the non-privileged account. For example, BleachBit will clean root's web browsers, which are probably never used, so it may seem BleachBit is not finding the files you expect. In this case, use the Bleachbit as Administrator option to clean any system files that require special privileges, and then use regular BleachBit to clean files in your personal profile.

In the second case, BleachBit runs with elevated privileges in the context of the non-privileged account, so all options can cleaned from one session.

To check which case applies to you, start BleachBit as Administrator, click on Help - System Information, and look at the value for ```os.path.expanduser('~')```. If it equals ```/root```, then the first case is happening, so run BleachBit both as administrator and as a regular user to clean all files.

Another way to check is first to run BleachBit as administrator. Then run BleachBit as a regular user, and if the preview shows any files, then you may need to run BleachBit as a regular user.

### Q: How to run the GUI as root on Linux under Wayland?

A: As the unprivileged user, run this command to allow the local user's X session:

```xhost si:localuser:root```

When finished, disable the access:

```xhost -si:localuser:root```

Avoid running GUI applications as root.

Source: [[ArchWiki]](https://wiki.archlinux.org/title/Running_GUI_applications_as_root)

### Q: How do I recover a file deleted by BleachBit?

"I had BleachBit delete data, but now I want it back. Is there an undo command?"

A: The success of recovery depends on whether the file was overwritten, and the ease of recovery depends on whether the metadata was overwritten. If in the preferences the option "Overwrite files to prevent recovery" was enabled, the file probably cannot be recovered. There is an exception if the file system is ext3 or ext4 in `data=journal` mode. The default file system on Ubuntu is ext4 with `data=ordered` mode, which makes recovery unlikely.

If the *wipe free space* command was used on the same file system, the file probably cannot be deleted regardless of the type of file system. See also [Shred files and wipe disks](/doc/shred-files-and-wipe-disks.html) for more information.

The chances of recovery decline as data is written to the drive and as time passes.

Immediately the file is deleted in a normal way (in other words, if it is not overwritten), the full contents still exist and full recovery is stil possible. To maximize the chance of recovery, avoid writing any data to the file system. This step is most important when there is little free space. Often the file system for which recovery is desired is also the primary file system, so the computer should be turned off and rebooted into a bootable operating system from a bootable CD or USB drive.

Finally, run a file recovery tool. Do a search on the web for "undelete" or "file recovery."

### Q: Why does BleachBit take a long time while filling up the hard drive?

A: Check under the System cleaner whether the option **Free disk space**
(version 5.0.2 and prior) or **Empty Space** (version 5.1.0 and later) is enabled.
The purpose is not to increase the amount of available space. Instead, its purpose
is to make previously deleted files unrecoverable.

This feature works by creating large, empty files (see [Shred files and wipe disks](/doc/shred-files-and-wipe-disks.html)
for more information). The duration to wipe empty space depends on the speed of the
hardware and the free capacity, and it commonly takes more than five minutes.

When the hard drive is full, BleachBit immediately deletes the file, and there will
be no net change in disk space.

Wiping empty space is not necessary if your drive is protected with full-disk encryption
such as BitLocker or LUKS. Wiping works best on traditional hard drives. On solid-state
drives, it is less reliable, and frequent use contributes to wear.

If wiping empty space is disabled, but BleachBit is still slow, look at the option
**Edit - Preferences - General - Overwrite Contents**. Enabling this option makes BleachBit
slower because more work is required to make files unrecoverable.

### Q: I closed BleachBit while it was working for a long time, and now my hard drive is full. How do I fix it?
A: Run BleachBit, and clean the option **System - Temporary Files**. On Linux, also clean **System - Cache**. This will delete one or more files that are gigantic and have random filenames.

In case you are using the command line or another application to delete these files, the default location on Linux is `~/.cache/`. If it is not the same partition, `/tmp/` is also used. On Windows, the default locations are `%TMP%`. If there are other fixed drives such as `D:`, they are also used.

If you changed the default options under **Preferences - Drives**, look there for the large files.

If you cannot boot Ubuntu because the disk is full, use the [Ubuntu Recovery Mode](https://wiki.ubuntu.com/RecoveryMode) like this:

1. Reboot the system.
1. Choose the boot option *Advanced options for Ubuntu*.
1. Choose a recent kernel with *(recovery mode)*.
1. In the Recovery Menu, choose _clean_. Note: this will mount your filesystem.
1. If this cleans enough space, boot normally and then clean the cache as mentioned above.
1. Otherwise, choose  _root_ from the Recovery Menu.
1. Type this command to switch to your normal user account: <tt>su <i>username</i> -</tt>. (Replace _username_ with your username.)
1. Run this command to clean the user's cache: `rm -rf ~/.cache/`.
1. Reboot.

In the future, you may avoid this situation by disabling the BleachBit option **System - Free Disk Space**. Otherwise, do not interrupt BleachBit while it is working.


### Q: How many passes does BleachBit make for the overwrite file option (shredding file)?
A: See [Shred files and wipe disks](/doc/shred-files-and-wipe-disks.html).

### Q: How do I see BleachBit in my own language on Microsoft Windows?
A: There are a few ways to affect the language of the BleachBit user interface.

In the Windows search bar, type "Language settings" and open it. Under the Windows display language, choose the preferred language, and then restart BleachBit.

To force BleachBit to always show in English, you have a few options:

* Download and install the English installer instead of the regular installer.
* If using the regular (non-English-only) installer, uncheck the option to install translations.
* Manually delete the translations. The default location for translations is `c:\Program Files (x86)\BleachBit\share\locale`.

The language chosen in the BleachBit installer does not affect the BleachBit application: it affects only the language of the installer.

Since [BleachBit 4.9.0 alpha](https://www.bleachbit.org/news/bleachbit-490-alpha), there is an option in the BleachBit preferences to change the language ([video demonstration](https://github.com/bleachbit/bleachbit/issues/1758#issuecomment-2603127349)). Most changes take effect immediately. To reflect changes for the application menu, restart the application.

## Things to know

While these may not be asked, they are not common knowledge:

### Q: What is format for the versioning number system?
A: Since BleachBit version 1.0 the numbering system is like that of GNOME, Linux between 1.0 and 2.6, and other projects: the format is basically *a.b*. When *b* is odd like 1.1, it is an unstable release (alpha or beta), and when *b* is even like 1.2, it is a stable release. Also, *b* can be greater than 9, so version 1.10 is newer than version 1.8.

### Q: Should I delete cache?
A: Cache generally improves the performance of your computer. For example, browser cache prevents many files (such as pieces of web pages) from being downloaded again. Getting the file from the cache is much faster than downloading it&mdash;even with fast bandwidth. Applications (such as web browsers) normally delete the useless parts of cache to prevent it from growing too large and to make room for new, potentially-useful data.

Yet, cache contains content you have viewed and can be used to reconstruct some of your browsing history. Especially for applications that you deleted, some cache is never used, so the space is wasted. Finally, deleting a large cache saves time and storage space before making a backup.

### Q: Should I delete cookies?
A: Cookies are not inherently evil or dangerous. The following statements are *false*:

*   Cookies have no uses besides advertising
*   Cookies can infect a computer like a virus
*   Cookies cause popup ads
*   Cookies can read arbitrary information from your computer (such as your name, your credit card, or private documents)

Cookies perform useful functions such as maintaining your login information: this saves you the time of logging in again. Many web sites use cookies to make honest improvements such as simplifying confusing navigation. Cookies rarely contain personally identifiable information (such as a name or email address). With a high degree of success (but a greater hassle for the web operator), web sites can still track visitors who have cookies disabled (using unique information such as IP address, user agent, plugins, etc), so disabling cookies may not have the intended effect.

On the other hand, some web sites use tricks (e.g., "evercookie" technology) to resurrect deleted cookies and try to track users between browsers on the same computer. Using another trick, cookies can track visitors between web sites for behavioural ad targeting: for example, once you visited an online camping store, and suddenly every other web site shows you ads for that camping store.

### Q: Is BleachBit "safe"?
A: BleachBit identifies and organizes the files you are most likely want to delete. For a few options which are most likely to cause you regret, it shows a popup warning. In that sense, BleachBit is much safer for a novice computer user than poking through the random directories hunting for files to delete. On the other hand, if the saying "One man's trash is another man's treasure" were not true or the saying "one size fits all" applied here, BleachBit would have no options. Carefully read the descriptions and warnings, and do not choose any options you do not understand or which make you uncomfortable.

### Q: Will BleachBit make my computer faster?
A: BleachBit probably will not make your computer faster in general, but there are two specific ways you may see your computer become faster. First, by removing excess files, you may see an improvement in the speed of virus scanning and for disk backups. Second, vacuuming SQLite databases speed up applications that use them. Firefox, Safari, and Google Chrome are some applications that stores various data, such as URL history, in an SQLite database. With heavy browsing, the databases become fragmented and bloated, and this happens at a level higher than the disk storage, so standard disk defragmentation tools are completely useless. BleachBit shrinks the SQLite database (saving disk space and disk I/O effort) and defragments them. You are most likely to see a dramatic benefit by not vacuuming for a while, using the application heavily, and then vacuuming it once, but to keep the application running quickly, vacuum often. Vacuuming is not a single solution to all performance problems, but it does complement other solutions. People buy faster computers with better CPUs and more RAM, but hard drive technology (other than the rare SSDs) has not become much faster than they were years ago. The hard disk is often the bottleneck, and vacuuming is one way to overcome this limitation.

Yet, deleting cache may make your computer slower because data will have to be re-downloaded or re-generated.
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "Why do I see permissions denied errors on Linux?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>If you are trying to clean the system (for example, localizations, APT, or DNF), run BleachBit with root permissions. To elevate permissions, choose the menu option \"BleachBit as Administrator\" <em>or</em> run <tt>sudo</tt> on the command line.</p>\n<p>Alternatively, when running as a normal user, uncheck options that require root permissions.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Why do I see permission denied errors on Windows?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>This happens when cleaning certain files, such as Windows system logs under <code>c:\\windows</code>.\nWhen you first launch BleachBit it should prompt you with the User Access Control dialog, which asks, \"Do you want to allow the following program to make changes to this computer.\" Answer <em>Yes</em> to grant BleachBit the privileges to modify all files.</p>\n<p>If you answer <em>No</em>, then BleachBit will start, and it will still be able to clean data under your user profile. However, it will not have access to clean system data.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "On Linux do I need to run BleachBit both as a normal user and as an administrator?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>It depends how your system elevates privileges. Linux has various tools (for example, kdesudo, gksudo sudo, su-to-root, and PolicyKit) with various options to elevate to root (administrator) privileges, and they create two different situations.</p>\n<p>In the first case, they switch the user to the root account, so BleachBit cleans the root account and not the non-privileged account. For example, BleachBit will clean root's web browsers, which are probably never used, so it may seem BleachBit is not finding the files you expect. In this case, use the Bleachbit as Administrator option to clean any system files that require special privileges, and then use regular BleachBit to clean files in your personal profile.</p>\n<p>In the second case, BleachBit runs with elevated privileges in the context of the non-privileged account, so all options can cleaned from one session.</p>\n<p>To check which case applies to you, start BleachBit as Administrator, click on Help - System Information, and look at the value for <code>os.path.expanduser('~')</code>. If it equals <code>/root</code>, then the first case is happening, so run BleachBit both as administrator and as a regular user to clean all files.</p>\n<p>Another way to check is first to run BleachBit as administrator. Then run BleachBit as a regular user, and if the preview shows any files, then you may need to run BleachBit as a regular user.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "How to run the GUI as root on Linux under Wayland?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>As the unprivileged user, run this command to allow the local user's X session:</p>\n<p><code>xhost si:localuser:root</code></p>\n<p>When finished, disable the access:</p>\n<p><code>xhost -si:localuser:root</code></p>\n<p>Avoid running GUI applications as root.</p>\n<p>Source: <a href=\"https://wiki.archlinux.org/title/Running_GUI_applications_as_root\">[ArchWiki]</a></p>"
      }
    },
    {
      "@type": "Question",
      "name": "How do I recover a file deleted by BleachBit?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>\"I had BleachBit delete data, but now I want it back. Is there an undo command?\"</p>\n<p>The success of recovery depends on whether the file was overwritten, and the ease of recovery depends on whether the metadata was overwritten. If in the preferences the option \"Overwrite files to prevent recovery\" was enabled, the file probably cannot be recovered. There is an exception if the file system is ext3 or ext4 in <code>data=journal</code> mode. The default file system on Ubuntu is ext4 with <code>data=ordered</code> mode, which makes recovery unlikely.</p>\n<p>If the <em>wipe free space</em> command was used on the same file system, the file probably cannot be deleted regardless of the type of file system. See also <a href=\"/doc/shred-files-and-wipe-disks.html\">Shred files and wipe disks</a> for more information.</p>\n<p>The chances of recovery decline as data is written to the drive and as time passes.</p>\n<p>Immediately the file is deleted in a normal way (in other words, if it is not overwritten), the full contents still exist and full recovery is stil possible. To maximize the chance of recovery, avoid writing any data to the file system. This step is most important when there is little free space. Often the file system for which recovery is desired is also the primary file system, so the computer should be turned off and rebooted into a bootable operating system from a bootable CD or USB drive.</p>\n<p>Finally, run a file recovery tool. Do a search on the web for \"undelete\" or \"file recovery.\"</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Why does BleachBit take a long time while filling up the hard drive?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Check under the System cleaner whether the option <strong>Free disk space</strong>\n(version 5.0.2 and prior) or <strong>Empty Space</strong> (version 5.1.0 and later) is enabled.\nThe purpose is not to increase the amount of available space. Instead, its purpose\nis to make previously deleted files unrecoverable.</p>\n<p>This feature works by creating large, empty files (see <a href=\"/doc/shred-files-and-wipe-disks.html\">Shred files and wipe disks</a>\nfor more information). The duration to wipe empty space depends on the speed of the\nhardware and the free capacity, and it commonly takes more than five minutes.</p>\n<p>When the hard drive is full, BleachBit immediately deletes the file, and there will\nbe no net change in disk space.</p>\n<p>Wiping empty space is not necessary if your drive is protected with full-disk encryption\nsuch as BitLocker or LUKS. Wiping works best on traditional hard drives. On solid-state\ndrives, it is less reliable, and frequent use contributes to wear.</p>\n<p>If wiping empty space is disabled, but BleachBit is still slow, look at the option\n<strong>Edit - Preferences - General - Overwrite Contents</strong>. Enabling this option makes BleachBit\nslower because more work is required to make files unrecoverable.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "I closed BleachBit while it was working for a long time, and now my hard drive is full. How do I fix it?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Run BleachBit, and clean the option <strong>System - Temporary Files</strong>. On Linux, also clean <strong>System - Cache</strong>. This will delete one or more files that are gigantic and have random filenames.</p>\n<p>In case you are using the command line or another application to delete these files, the default location on Linux is <code>~/.cache/</code>. If it is not the same partition, <code>/tmp/</code> is also used. On Windows, the default locations are <code>%TMP%</code>. If there are other fixed drives such as <code>D:</code>, they are also used.</p>\n<p>If you changed the default options under <strong>Preferences - Drives</strong>, look there for the large files.</p>\n<p>If you cannot boot Ubuntu because the disk is full, use the <a href=\"https://wiki.ubuntu.com/RecoveryMode\">Ubuntu Recovery Mode</a> like this:</p>\n<ol>\n<li>Reboot the system.</li>\n<li>Choose the boot option <em>Advanced options for Ubuntu</em>.</li>\n<li>Choose a recent kernel with <em>(recovery mode)</em>.</li>\n<li>In the Recovery Menu, choose <em>clean</em>. Note: this will mount your filesystem.</li>\n<li>If this cleans enough space, boot normally and then clean the cache as mentioned above.</li>\n<li>Otherwise, choose  <em>root</em> from the Recovery Menu.</li>\n<li>Type this command to switch to your normal user account: <tt>su <i>username</i> -</tt>. (Replace <em>username</em> with your username.)</li>\n<li>Run this command to clean the user's cache: <code>rm -rf ~/.cache/</code>.</li>\n<li>Reboot.</li>\n</ol>\n<p>In the future, you may avoid this situation by disabling the BleachBit option <strong>System - Free Disk Space</strong>. Otherwise, do not interrupt BleachBit while it is working.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "How many passes does BleachBit make for the overwrite file option (shredding file)?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>See <a href=\"/doc/shred-files-and-wipe-disks.html\">Shred files and wipe disks</a>.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "How do I see BleachBit in my own language on Microsoft Windows?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>There are a few ways to affect the language of the BleachBit user interface.</p>\n<p>In the Windows search bar, type \"Language settings\" and open it. Under the Windows display language, choose the preferred language, and then restart BleachBit.</p>\n<p>To force BleachBit to always show in English, you have a few options:</p>\n<ul>\n<li>Download and install the English installer instead of the regular installer.</li>\n<li>If using the regular (non-English-only) installer, uncheck the option to install translations.</li>\n<li>Manually delete the translations. The default location for translations is <code>c:\\Program Files (x86)\\BleachBit\\share\\locale</code>.</li>\n</ul>\n<p>The language chosen in the BleachBit installer does not affect the BleachBit application: it affects only the language of the installer.</p>\n<p>Since <a href=\"https://www.bleachbit.org/news/bleachbit-490-alpha\">BleachBit 4.9.0 alpha</a>, there is an option in the BleachBit preferences to change the language (<a href=\"https://github.com/bleachbit/bleachbit/issues/1758#issuecomment-2603127349\">video demonstration</a>). Most changes take effect immediately. To reflect changes for the application menu, restart the application.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "What is format for the versioning number system?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Since BleachBit version 1.0 the numbering system is like that of GNOME, Linux between 1.0 and 2.6, and other projects: the format is basically <em>a.b</em>. When <em>b</em> is odd like 1.1, it is an unstable release (alpha or beta), and when <em>b</em> is even like 1.2, it is a stable release. Also, <em>b</em> can be greater than 9, so version 1.10 is newer than version 1.8.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Should I delete cache?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Cache generally improves the performance of your computer. For example, browser cache prevents many files (such as pieces of web pages) from being downloaded again. Getting the file from the cache is much faster than downloading it&mdash;even with fast bandwidth. Applications (such as web browsers) normally delete the useless parts of cache to prevent it from growing too large and to make room for new, potentially-useful data.</p>\n<p>Yet, cache contains content you have viewed and can be used to reconstruct some of your browsing history. Especially for applications that you deleted, some cache is never used, so the space is wasted. Finally, deleting a large cache saves time and storage space before making a backup.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Should I delete cookies?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>Cookies are not inherently evil or dangerous. The following statements are <em>false</em>:</p>\n<ul>\n<li>Cookies have no uses besides advertising</li>\n<li>Cookies can infect a computer like a virus</li>\n<li>Cookies cause popup ads</li>\n<li>Cookies can read arbitrary information from your computer (such as your name, your credit card, or private documents)</li>\n</ul>\n<p>Cookies perform useful functions such as maintaining your login information: this saves you the time of logging in again. Many web sites use cookies to make honest improvements such as simplifying confusing navigation. Cookies rarely contain personally identifiable information (such as a name or email address). With a high degree of success (but a greater hassle for the web operator), web sites can still track visitors who have cookies disabled (using unique information such as IP address, user agent, plugins, etc), so disabling cookies may not have the intended effect.</p>\n<p>On the other hand, some web sites use tricks (e.g., \"evercookie\" technology) to resurrect deleted cookies and try to track users between browsers on the same computer. Using another trick, cookies can track visitors between web sites for behavioural ad targeting: for example, once you visited an online camping store, and suddenly every other web site shows you ads for that camping store.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Is BleachBit \"safe\"?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>BleachBit identifies and organizes the files you are most likely want to delete. For a few options which are most likely to cause you regret, it shows a popup warning. In that sense, BleachBit is much safer for a novice computer user than poking through the random directories hunting for files to delete. On the other hand, if the saying \"One man's trash is another man's treasure\" were not true or the saying \"one size fits all\" applied here, BleachBit would have no options. Carefully read the descriptions and warnings, and do not choose any options you do not understand or which make you uncomfortable.</p>"
      }
    },
    {
      "@type": "Question",
      "name": "Will BleachBit make my computer faster?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "<p>BleachBit probably will not make your computer faster in general, but there are two specific ways you may see your computer become faster. First, by removing excess files, you may see an improvement in the speed of virus scanning and for disk backups. Second, vacuuming SQLite databases speed up applications that use them. Firefox, Safari, and Google Chrome are some applications that stores various data, such as URL history, in an SQLite database. With heavy browsing, the databases become fragmented and bloated, and this happens at a level higher than the disk storage, so standard disk defragmentation tools are completely useless. BleachBit shrinks the SQLite database (saving disk space and disk I/O effort) and defragments them. You are most likely to see a dramatic benefit by not vacuuming for a while, using the application heavily, and then vacuuming it once, but to keep the application running quickly, vacuum often. Vacuuming is not a single solution to all performance problems, but it does complement other solutions. People buy faster computers with better CPUs and more RAM, but hard drive technology (other than the rare SSDs) has not become much faster than they were years ago. The hard disk is often the bottleneck, and vacuuming is one way to overcome this limitation.</p>\n<p>Yet, deleting cache may make your computer slower because data will have to be re-downloaded or re-generated.</p>"
      }
    }
  ]
}
</script>
