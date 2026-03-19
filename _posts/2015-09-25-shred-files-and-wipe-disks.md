---
layout: page
title: "How to Shred Files and Wipe Disks with BleachBit"
nav_title: "Shred Files"
category: doc
date: 2015-09-25 23:33:58
order: 6
---

When software deletes a file, it typically erases only the file's metadata,
such as the name, location, and timestamps, leaving the actual contents intact
and recoverable. BleachBit offers **secure erase** features (also called file
shredding or secure overwriting) to permanently remove that data.

Before diving in, there's one important thing to understand:
**1 pass is enough. 35 passes are not.**

---

## The short version

- A single overwrite pass is all you need on modern hard drives.
- "DoD 7-pass" and "Gutmann 35-pass" methods are widely misunderstood:
  even Gutmann himself called the 35-pass technique "voodoo."
- The DoD standard applies only to wiping entire drives, not individual
  files. For drives leaving DoD custody, only physical destruction is
  approved.
- SSDs complicate things: see [HDDs vs. SSDs](#hdds-vs-ssds) below.
- No software method is a complete solution. Backups, cloud storage, and
  ISP records are outside the reach of any disk-wiping tool.

---

## Common myths

| Claim | Reality |
|---|---|
| Data overwritten once can be recovered by government agencies | No credible evidence supports this |
| Multiple passes are harder to recover than a single pass | One pass is sufficient for modern drives |
| Gutmann recommends 35 passes for all drives | His paper applied to older drive technology; he later called the method misunderstood |
| DoD/NSA methods can shred individual files | These standards apply only to entire drive sanitization |
| The DoD approves software overwriting as a sanitization method | Only degaussing or physical destruction is approved for drives leaving DoD custody |

---

## What BleachBit can do

BleachBit offers four secure wiping features:

1. **Overwrite files found by its cleaners** (e.g., Firefox cache,
   browser history)
2. **Overwrite specific files** anywhere on your drive (e.g., a
   confidential spreadsheet)
3. **Wipe empty disk space**: overwrites areas where previously deleted
   files lived
4. **Wipe RAM and swap**: removes passwords and web pages stored in
   memory *(Linux only)*

Shredding is slower than a normal delete because it must process every
byte of the file, not just its metadata entry.

BleachBit uses a **single overwrite pass** so you get security without
the false reassurance of unnecessary extra passes. It also renames files
before deletion to obscure the original filename.

---

## Why one pass is enough

Some tools advertise "advanced" methods such as Gutmann 35-pass, DoD
7-pass, or NSA 3-pass. These references are largely misunderstood:

- Gutmann's original 1996 paper addressed specific encoding techniques
  used by older hard drives. Modern drives use different technology,
  making those extra passes irrelevant.
- Gutmann later clarified that people had turned his method into
  "a kind of voodoo incantation."
- Wikipedia describes recovering single-pass overwritten data from a
  modern drive as "urban legend."
- If single-pass recovery were genuinely possible, data recovery firms
  would charge premium prices for it.

The DoD 5220.22-M standard is also frequently misrepresented. It was
designed to wipe entire drives, not individual files or empty space.
Any software claiming "DoD-compliant" file shredding is misapplying
the standard.

---

## HDDs vs. SSDs

Secure deletion behaves differently depending on your storage type.

### Hard disk drives (HDDs)

On a traditional spinning drive, overwriting a file's data blocks is
reliable: the the drive typically writes back to the same logical sector,
which maps consistently to physical media unless reallocation has occurred.
A single overwrite pass is sufficient. The challenge is overwriting the
correct blocks: see notes below about file systems.

Mechanical HDDs maintain a pool of spare sectors used to replace bad sectors.
When a sector is remapped, the original physical location is retired and
becomes inaccessible to the OS. As a result, previously written data may
persist in these retired sectors and cannot be overwritten by software,
even during a full-drive wipe.

### Solid-state drives (SSDs)

SSDs are more complicated:

- **Wear leveling** causes the drive's controller to spread writes
  across cells, so overwriting a file may not touch the blocks that
  held the original data.
- **TRIM** tells the SSD to erase blocks as soon as a file is deleted,
  which can be helpful, but it's handled by the drive firmware, not
  BleachBit, and isn't guaranteed to be immediate or complete.
- **Overprovisioned spare area** holds data that is completely
  inaccessible to the OS and any software running on it.

For SSDs, the most reliable sanitization methods are:
1. **Full-drive encryption** before storing data, so leftover blocks
   are unreadable without the key.
2. **Manufacturer secure erase** commands (e.g., ATA Secure Erase or
   NVMe Format), issued from a trusted environment.
3. **Physical destruction** for the highest-stakes situations.

File shredding and free-space wiping on an SSD offer weaker guarantees
than on an HDD. Treat them as a best-effort measure rather than a
guarantee.

---

## Limits to know

Secure deletion has real-world limitations. Understanding them helps you
decide whether extra steps are worth it.

### When shredding individual files

Shredding works best when:

- The file's size has never shrunk (editing a file smaller may leave
  fragments in previously used disk blocks)
- The file has never moved (some apps save by writing a new temp file
  and deleting the old one)
- The file system doesn't use journaling. Modern journaling file systems
  like NTFS, ext3, and ext4 log changes to prevent data corruption
  during crashes. Even if a file is successfully overwritten, some
  metadata, and in certain configurations, small amounts of file data,
  may persist in the filesystem journal.
- The file isn't tiny. On Windows, NTFS stores very small files
  (roughly under 1KB) directly inside its Master File Table (MFT)
  rather than in standard data blocks. A standard file overwrite might
  completely miss the data lingering in the MFT.

In non-ideal cases, the deleted data is scattered across unmarked disk
space, which is difficult to recover partially and very likely
impossible to recover fully.

### When wiping empty disk space

- It can be slow.
- It won't touch **remapped bad sectors**: when a drive sector fails,
  the drive silently maps it elsewhere, and wiping tools can't reach
  that hidden area.
- On SSDs, it cannot reach overprovisioned spare area (see above).
- It doesn't help with backups, cloud storage, email servers, or ISP
  records.

---

## Making recovery harder: The haystack approach

Even when some data can't be fully wiped, you can make forensic
recovery far slower and more expensive by burying it in noise.
BleachBit's [Chaff](/doc/chaff.html) feature generates large volumes
of semi-realistic decoy data, turning a needle-in-a-haystack problem
into an overwhelming one. This complements other methods; it doesn't
replace them, but it raises the cost and time required for anyone
attempting recovery.

## How to think about your risk level

Security isn't black and white. Before deciding how thorough to be,
ask:

- **What am I protecting?** Personal embarrassment? Financial data?
  A trade secret?
- **Who might try to access it?** A family member? A competitor?
  A government agency?
- **How much effort would they invest?** A quick file scan?
  A forensic lab?

Your answers should guide how far up the escalation ladder you
need to go.

## Escalating levels of secure deletion

Choose the level that fits your situation. Each step increases security
but also increases time, effort, or cost:

1. **Shred the specific file**: fast and good for most cases on HDDs;
   minimal disruption but won't catch fragments elsewhere
2. **Wipe empty disk space**: catches fragments from previously deleted
   files; slower and limited effectiveness on SSDs
3. **Wipe the entire drive** (e.g., with ShredOS): removes everything,
   including the OS and swap files; requires reinstallation afterward
4. **Physically destroy the drive**: the only method approved for the
   highest security needs.

## Practical tips

- **Don't bother with multiple passes**: they waste time and offer
  no real security benefit on modern drives.
- **Be skeptical of tools advertising 35-pass or DoD-compliant file
  shredding**: it's often marketing, not security.
- **Use full-disk encryption** for ongoing protection, not just
  at deletion time. This is especially important on SSDs.
- **Don't over-use "Wipe Free Space"** on SSDs. While it can help
  clear remnants, it causes significant "write wear." Use it sparingly,
  or rely on TRIM and encryption instead.
- **Use ShredOS before giving away a spinning hard drive**: deleting
  files and wiping free space isn't enough. Swap files, hibernation
  files, and application registries may still hold sensitive data.
  For SSDs, use the manufacturer's secure erase tool instead.
- **Generate decoy data with Chaff** to raise the cost of any
  forensic recovery attempt.
- **Remember what's out of your control**: files sent via email,
  uploaded to the cloud, or accessed over a network may live on
  servers you don't control.
- **For true DoD-level security**, physical destruction or degaussing
  is the only approved method. No software qualifies.

## Further reading

- [Data Remanence](https://en.wikipedia.org/wiki/Data_remanence)
  (Wikipedia)
- [Gutmann Method: Criticism](https://en.wikipedia.org/wiki/Gutmann_method#Criticism)
  (Wikipedia)
- [One Big File Is Not Enough](https://cs.harvard.edu/malan/assets/pdfjs-2.9.359-dist/web/viewer.html?file=/malan/publications/pet06.pdf)
  (Garfinkel & Malan, 2006)