---
layout: page
title: "Install on Linux"
category: doc
date: 2015-09-30 20:37:20
order: 1
---


### Sources

Linux users have a few choices for installing BleachBit.

1. [Download](https://www.bleachbit.org/download/linux) the latest installation package for your system.
2. Install using your distribution's package manager.
3. Install from source.

Most popular distributions have BleachBit in their repositories, and this is a convenient way to install. However, Ubuntu, Debian, Linux Mint, and other distributions have a "no-rolling release policy," which means they do not update their repositories with the latest BleachBit releases.

Here is an example of this policy. Ubuntu Questing 25.10 (released October 2025) will always have BleachBit 4.6.2, which was released October 2025, even though BleachBit 5.0 was released in May 2025. Users who want to upgrade to BleachBit 5 while using the Ubuntu repositories will have to upgrade to Ubuntu 26.04 in April 2026.

It is your choice to install from the distribution's repositories, but in case of any issues with the software, first check for a newer release.


### Software dependencies

BleachBit 5 requires GTK 3.24 and Python 3.8 or later.

### Signatures for .rpm and .deb packages

Starting after BleachBit 5.0.2, the .rpm and .deb packages will be signed with the same key. This will make it easier to verify the signatures.

### Ubuntu, Mint, and Debian

#### Graphical package manager

Double click on the downloaded installation package which has a name like `bleachbit_5.0.2-0_all_ubuntu2504.deb`. Then, follow the prompts. You may see a security warning about third-party packages, and you may need to enter your password to install BleachBit.

#### Command line

Install using the command line like this:

`sudo apt install bleachbit_5.0.2-0_all_ubuntu2504.deb`

Using apt is recommended over dpkg because it will automatically install dependencies.

### Fedora, Red Hat, CentOS

#### Graphical package manager

To install BleachBit using the graphical package manager, double click on the downloaded installation package which has a name like `bleachbit-5.0.2-1.1.fc43.noarch.rpm`. Then, follow the prompts.

#### Command line

Alternatively, install using the command line like this.

`sudo dnf install bleachbit-5.0.2-1.1.fc43.noarch.rpm`

### Digital signatures

Verifying the digital signature protects you against file corruption and tampering.

To verify the digital signature, first you will need a public key. BleachBit versions 3.0 and later are signed with key 0xd6d447b02b4d4c9d ([Ubuntu Keyserver](https://keyserver.ubuntu.com/pks/lookup?search=ahz001%40gmail.com&fingerprint=on&op=index) or [SourceForge](https://sourceforge.net/projects/bleachbit/files/public_key/andrew2019.key/download)). Older releases before BleachBit version 3.0 were signed with key 0x51416DE60E6887FD ([Sourceforge](https://sourceforge.net/projects/bleachbit/files/public_key/andrew2009.key/download)). After downloading the key to a local file, import it into GnuPG like this:

```sh
$ gpg --import andrew2019.key
gpg: key D6D447B02B4D4C9D: public key "Andrew Ziem <ahz001@gmail.com>" imported
gpg: Total number processed: 1
gpg:               imported: 1
```

Notice the key ID D6D447B02B4D4C9D in the console output matches the key ID above on this web page. The key ID is case insensitive, and the leading `0x` is sometimes omitted, so the key IDs match.

Second, download either detached signatures or signed checksums. You do not need both.

There is one detached signature per download. Look in the [SourceForge release directory](https://sourceforge.net/projects/bleachbit/files/bleachbit/) for a folder called `detached_signatures`, and in the folder will be a file with the same name as the download plus the `.sig` extension. For example, the detached signature for `bleachbit_5.0.2-0_all_ubuntu2504.deb` is named `bleachbit_5.0.2-0_all_ubuntu2504.deb.sig`. Here is an example of how to verify it.

```sh
$ gpg --verify bleachbit_5.0.2-0_all_ubuntu2504.deb.sig bleachbit_5.0.2-0_all_ubuntu2504.deb
gpg: Signature made Sat 26 Oct 2019 08:04:00 AM MDT
gpg:                using RSA key A9E582E4054A159315EDC943D6D447B02B4D4C9D
gpg: Good signature from "Andrew Ziem <ahz001@gmail.com>" [ultimate]
```

Instead of detached signatures, another option is the signed checksums. There is one signed checksum file per version of BleachBit. Verification is a two-step process. In the first step, verify the signature.

```sh
$ gpg --verify bleachbit-5.0.2-sha256sum.txt.asc
gpg: Signature made Fri 07 Nov 2025 08:51:03 PM MST
gpg:                using RSA key A9E582E4054A159315EDC943D6D447B02B4D4C9D
gpg: Good signature from "Andrew Ziem <ahz001@gmail.com>" [ultimate]
gpg: WARNING: not a detached signature; file 'bleachbit-5.0.2-sha256sum.txt' was NOT verified!
```
Watch for the "Good signature," and ignore the warning.

Second, verify the checksums like this:

```sh
$ sha256sum -c bleachbit-5.0.2-sha256sum.txt.asc
bleachbit_5.0.2-0_all_debian11.deb: OK
bleachbit_5.0.2-0_all_debian12.deb: OK
bleachbit_5.0.2-0_all_debian13.deb: OK
bleachbit_5.0.2-0_all_ubuntu2004.deb: OK
bleachbit_5.0.2-0_all_ubuntu2204.deb: OK
bleachbit_5.0.2-0_all_ubuntu2404.deb: OK
bleachbit_5.0.2-0_all_ubuntu2504.deb: OK
BleachBit-5.0.2-portable.zip: OK
BleachBit-5.0.2-setup.zip: OK
bleachbit-5.0.2-1.1.alma9.noarch.rpm: OK
bleachbit-5.0.2-1.1.fc41.noarch.rpm: OK
bleachbit-5.0.2-1.1.fc42.noarch.rpm: OK
bleachbit-5.0.2-1.1.fc43.noarch.rpm: OK
bleachbit-5.0.2-1.1.opensuseSlowroll.noarch.rpm: OK
bleachbit-5.0.2-1.1.opensuseTumbleweed.noarch.rpm: OK
bleachbit-5.0.2-lp156.1.1.opensuse156.noarch.rpm: OK
bleachbit-5.0.2-lp160.1.1.opensuse160.noarch.rpm: OK
BleachBit-5.0.2-setup-English.exe: OK
BleachBit-5.0.2-setup.exe: OK
bleachbit-5.0.2.tar.gz: OK
bleachbit-5.0.2.tar.bz2: OK
bleachbit-5.0.2.tar.lzma: OK
sha256sum: WARNING: 15 lines are improperly formatted

```

If you don't download all the files, you will see "No such file or directory errors." Instead, focus on the "OK" for the file you downloaded. Also, ignore the "improperly formatted" warning because sha256sum doesn't recognize lines added by PGP.


