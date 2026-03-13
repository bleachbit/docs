---
layout: page
title: "How to Shred Files and Wipe Disks with BleachBit"
nav_title: "Shred Files"
category: doc
date: 2015-09-25 23:33:58
order: 6
---

Normally when software deletes a file, only the "metadata" is erased: that means the complete contents often can easily be recovered, so BleachBit (and similar applications) offer secure erase features (also called secure wipe, secure overwriting, or file shredding) to permanently remove data. Some applications even advertise "advanced" erasure methods referencing important names in security such as Gutmann, the United States Department of Defense, and the NSA, but these references often mislead people to waste time on snake oil technological remedies while ignoring important basics. Any product or method suggesting a convenient, comprehensive solution to security is deceptive: convenience and security oppose each other. This guide will explain **how 1 pass is enough, but 35 passes are not enough.** Regardless of the tools you use, please read this guide carefully and completely.

## tl;dr: Secure File Deletion

**1 pass is enough. 35 passes are snake oil.**

"DoD 7-pass" and "Gutmann 35-pass" are widely misunderstood: even
Gutmann called the 35-pass method "voodoo." The DoD standard only
applies to wiping entire drives, not individual files. For drives
leaving DoD custody, only physical destruction is approved.

**Limits to know:**
- File shredding may miss old data if the file shrank or moved
- Free-space wiping misses remapped bad sectors
- Neither touches backups, cloud, ISPs, etc.

**Escalating options:** shred files → wipe empty space → DBAN the
whole drive → physical destruction.

## Myths and legends

Most of the confusion regarding the topic of data remanence (data left behind after it is deleted) is because of myths and urban legends. Before discussing what is true, let's preview what is not:

*   False: Data on a hard drive overwritten by one pass can be recovered by powerful government agencies
*   False: Overwriting data with multiple passes makes it harder to recover than overwriting it with a single pass.
*   False: Peter Gutmann thinks data should be overwritten with 35 passes to prevent recovery.
*   False: Peter Gutmann's paper applies to modern hard drives.
*   False: There are methods approved by the DOD (5220.22-M), NSA, and Gutmann to shred files.
*   False: The United States Department of Defense approves of overwriting of a whole hard drive as a data sanitation method.

The details are explained below.

## What features does BleachBit have to securely wipe files?

Today BleachBit offers these features

1.  Overwrite specific files found by its cleaners to hide the contents of these files (such as Firefox Internet cache).
2.  Overwrite specific files found anywhere on the hard drive (such as a confidential spreadsheet on your desktop).
3.  Wipe empty disk space to hide the contents of files previously deleted by any software.
4.  Wipe memory and swap to wipe data stored in RAM such as passwords and web pages (currently, only on Linux).

Shredding is much slower than deleting because deleting changes only the file system metadata, which is small and a consistent size for all files: the metadata is the name of the file, its location on the disk, a time stamp, owner, etc. On the other hand, shredding takes time proportional to the size of the file.

Because additional passes add no value and only offer a false sense of security (see below), BleachBit does not implement multiple passes. When overwriting is enabled, BleachBit wipes the data with a single pass of blank data. At the end of a file, it may write additional data to wipe the slack space. To hide the original name, BleachBit renames the file to a long name and then a short name. Finally, the file is deleted.

Unlike other cleaner applications, BleachBit shreds Internet history in Firefox without deleting the whole Firefox Places database.

## Are these features secure?

Concerned about the security of my house, once I asked a locksmith whether I should upgrade the standard lock on my front door. Not a good salesman, he replied, "Why bother? A burglar would just break the window."

Is driving a new car with air bags and a good crash test rating safe? Probably. How about when the car is operated by a 15-year old on a busy road at night while texting on his cell phone? Probably not. This analogy demonstrates two things. First, security is not black or white: there is always risk ranging from near (but not completely) zero to near 100%. Indeed, sometimes people even walk away from catastrophic car accidents. Second, the context is important: what is good in one situation is not good in another. Therefore, a better question is...

## How secure are BleachBit's methods?

When used appropriately, BleachBit's data wiping features are generally enough to hide traces of most data from most people.

Even more important than asking how secure an application or technique is, start by asking yourself

1.  What am I trying to hide? Is worth a lot of money? A few thousand that is in your bank account? A one million dollar trade secret?
2.  How much harm could it do if disclosed? Embarrass someone? Hurt a relationship? Break compliance with HIIPA or SOX? Bankrupt a large company? Shift global political power?
3.  Who would try to find it? A family member? A powerful rival company? A superpower government?
4.  How much time, money, and skill does that entity have? How much is it willing to spend to find your secrets?

The answers to these questions will lead you to the appropriate level of caution.

## Are multiple passes better than one pass?

Some applications advertise "advanced" erasure techniques such as the Gutmann
method (35 passes), DoD standard (7 passes), or NSA "approved" (3 passes).
These are based on a misreading of Peter Gutmann's original paper---the idea
being that overwriting data multiple times makes recovery harder. Years later,
Gutmann himself tried to correct the record
[[source](https://web.archive.org/web/20260310054328/https://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html#Epilogue)]:

> "Some people have treated the 35-pass overwrite technique described in it
> more as a kind of voodoo incantation to banish evil spirits."

In fact, a single pass is sufficient for modern drives. As Wikipedia notes, the
chances of recovering overwritten data from a modern hard drive amount to "urban
legend." If single-pass recovery were genuinely possible, scientists would
publish papers on it, data recovery firms would charge premium rates for it, and
drive manufacturers would exploit it to boost storage density. None of that has
happened.

There's a second problem with these advertised standards: the fine print. **The
DoD 5220.22-M standard was never designed to shred individual files or wipe empty
disk space**: it was designed to wipe an entire drive, destroying the OS,
software, settings, and all data. Furthermore, the Department of Defense only
approves software shredding *within* the DoD itself; for drives leaving DoD
custody, only physical destruction is approved. Any software claiming to shred
individual files or empty space in a "DoD-" or "NSA-compliant" manner is
misrepresenting the standard.

## Are multiple passes better than one pass?

Some applications advertise "advanced" erasure techniques such as the Gutmann method (35 passes), DoD standard (7 passes), or NSA "approved" (3 passes). These are based on a misreading of Peter Gutmann's original paper — the idea being that overwriting data multiple times makes recovery harder. Years later, Gutmann himself tried to correct the record:

> "Some people have treated the 35-pass overwrite technique described in it more as a kind of voodoo incantation to banish evil spirits."

In fact, a single pass is sufficient for modern drives. As Wikipedia notes, the chances of recovering overwritten data from a modern hard drive amount to "urban legend." If single-pass recovery were genuinely possible, scientists would publish papers on it, data recovery firms would charge premium rates for it, and drive manufacturers would exploit it to boost storage density. None of that has happened.

There's a second problem with these advertised standards: the fine print. **The DoD 5220.22-M
standard was never designed to shred individual files or wipe empty disk space** — it was
designed to wipe an entire drive, destroying the OS, software, settings, and all data.
Furthermore, the Department of Defense only approves software shredding *within* the DoD
itself; for drives leaving DoD custody, only physical destruction is approved. Any software
claiming to shred individual files or empty space in a "DoD-" or "NSA-compliant" manner is
misrepresenting the standard.

## Limits of shredding files and wiping empty disk space

Shredding individual files and empty disk space has limited benefits for any cleaner application, including BleachBit. Once you understand the limits, you will know whether taking extra mitigation steps is worthwhile.

Shredding an individual file properly assumes its location can be completely known, but basically it can only be known in one ideal case. The ideal case has three characteristics:

1.  The file size has never shrunk because of editing. Imagine starting with a 3MB spreadsheet, editing it down to 1MB (using the spreadsheet application), and asking the cleaner application to delete the 1MB version: the cleaner has no way of knowing where the missing 2MB was allocated on the physical hard drive. (Remember: file systems often don't store files continuously, so you can't assume the missing part was directly after the known part.) ![Graphic illustrating layout of file on disk in blocks](https://lh5.ggpht.com/_1XYQfEGGEIw/TMG_UyXYeVI/AAAAAAAACx4/mclA1xjpxlE/s800/file_shred_graphics.png)
2.  The file never moved. Imagine the spreadsheet software saves the document by writing a new copy to a temporary file, deleting the old copy, and renaming the temporary file to the original name. In this case, the cleaner application has no way of knowing where any of the old spreadsheet was located.
3.  The file system overwrites files to the same place. This is a good assumption. On Windows NTFS and on Linux the most common ext3 configuration (which is the default on Ubuntu 9.10 and other Linux distributions) overwrite files in the same place, but transparent disk compression, encryption, and sparse files may not overwrite files in place.

Though BleachBit cannot know the location of file after it is deleted or moved, neither can any other software. The deleted data is now floating in a giant pool of noise. In other words, a file shredded by BleachBit _even in these non-ideal scenarios_ is difficult to recover _partially_ and likely impossible to recover _fully_. A file shredding in the ideal case should be impossible to recover—even partially.

The three problems above are addressed by wiping empty disk space: it doesn't matter where the previous file was located. If the deleted file is allocated now by a new file, the new file has overwritten it. If the previous location is not allocated now, the cleaner will overwrite it.

However, wiping empty disk space has several of its own challenges:

1.  It can be slow, so many people are not willing to use it.
2.  File systems allocate space in fixed chunks called a block size, and many files do not use all the last block. A 5,000,000 byte file on a 4096 size block file system would use 1220 full blocks and 1 partial block with 2880 bytes. Say the file was deleted and a new file in the same place used 1024 bytes of the last block. That means 1856 bytes of the old file (0.03%) is not overwritten in what is called the "slack space" of the new file. Because cleaning slack space is tricky and realistically little useful data can be recovered from such tiny pieces (typically not more than 4096 bytes), BleachBit does not clean slack space when wiping empty disk space. (Remember: BleachBit _does_ wipe slack when wiping individual files.)
3.  When an area of a modern hard drive is damaged, it automatically remaps the bad sector to a spare. The operating system and applications are unaware of the move, so wiping the drive ignores the damaged area. According to [DBAN](https://dban.org/), a powerful disk wiping tool, it does not erase remapped sectors and hidden areas.

## How to securely delete data

To permanently delete data, there is an order of progression with trade-offs of convenience and time vs privacy:

1.  Shred the file (with one pass).
2.  Overwrite the empty disk space.
3.  Overwrite the whole drive (including the operating system and all data).
4.  Mechanically destroy or degauss the drive.
5.  Destroy data on backups, ISPs, online accounts, etc.

However, in practice things become more complicated.

## Keeping data private

Here are some suggestions to keep your data private

0.  Don't keep secrets. It's easier to sleep.
0.  Don't waste time with multiple passes for data sanitation.
0.  Second guess any software which advertises multiple passes to wipe files or empty disk space. Is it snake oil?
0.  Use full volume encryption, though someone may [hit you with a $5 wrench](https://xkcd.com/538/) until you reveal the key.
0.  If you want to make forensic recovery slower and more expensive, generate large volumes of semi-realistic decoy data with [Chaff](/doc/chaff.html). This complements other methods; it does not replace them.
0.  If giving a hard drive or whole computer to someone else, use DBAN to wipe the entire drive, including the remapped sectors—even though reinstalling an operating system, security updates, applications, and settings is a pain. It's not enough to delete files, empty the recycle bin (or trash can), and wipe the free space because some useful data may be in the swap file, hibernation file, Windows registry, and application registries (such as passwords in Firefox's configuration). If you are not willing to do that, minimally delete the user accounts on the system and _then_ wipe empty disk space.
0.  If you need DoD class security, use the only sanitation method approved by the DoD 5220.22-M standard: degauss or mechanically destroy the storage device. No software can physically do this.
0.  Don't assume you control all the data. Say you download a file from www.example.com: there may be records on your computer, your ISP, www.example.com's server, www.example.com's ISP, www.example.com's backup site, the Internet backbone, etc. Think about how much data is stored on your email server, Facebook account, etc.
0.  Don't use any computers because the Nosy Secret Agents may be looking over your shoulder using Van Eck phreaking.

## Suggested reading

*   ["Data Remanence"](https://en.wikipedia.org/wiki/Data_remanence) (Wikipedia)
*   ["Gutmann method: criticism"](https://en.wikipedia.org/wiki/Gutmann_method#Criticism) (Wikipedia)
*   [One big file is not enough: A critical evaluation of the dominant free-space sanitization technique](https://cs.harvard.edu/malan/assets/pdfjs-2.9.359-dist/web/viewer.html?file=/malan/publications/pet06.pdf) (Garfinkel and Malan, 2006)
