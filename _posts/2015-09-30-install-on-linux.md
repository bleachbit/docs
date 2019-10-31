---
layout: page
title: "Install on Linux"
category: doc
date: 2015-09-30 20:37:20
order: 1
---


To install BleachBit, first [download](https://www.bleachbit.org/download/linux) the latest installation package for your system.

### Requirements

BleachBit version 2.2 required Python 2.7 and GTK version 2. It did *not* support Python 2.5, Python 2.7, Python 3, or GTK 3.

BleachBit 3 requires GTK 3 and Python 2.7.

BleachBit 4 (coming soon) will require GTK 3 and Python 3.


### Ubuntu, Mint, and Debian

#### Graphical package manager

Double click on the downloaded installation package which has a name like `bleachbit_3.0_all_ubuntu1910.deb`. Then, follow the prompts.

#### Command line

Install using the command line like this:

`sudo dpkg -i bleachbit_3.0_all_ubuntu1910.deb`

Installing using apt from the distribution's repositories is _not_ recommended because they tend to carry old releases of BleachBit.


### Fedora, Red Hat, CentOS

#### Graphical package manager
To install BleachBit using the graphic package manager, double click on the downloaded installation package which has a name like `bleachbit-2.2-1.1.fc28.noarch.rpm`. Then, follow the prompts.


#### Command line
Alternatively, install using the command line like this.

To avoid a key error, import the public key:

```
wget http://bleachbit.sourceforge.net/bleachbit_public.key -O /tmp/bleachbit_public.key
sudo rpm --import /tmp/bleachbit_public.key
```

The following command installs BleachBit using the command line:

`sudo rpm -Uvh bleachbit-2.2-1.1.fc28.noarch.rpm`

### Digital signatures

Verifying the digital signature protects you against file corruption and tampering.

To verify the digital signature, first you will need a public key. BleachBit versions 3.0 and later are signed with key 0xd6d447b02b4d4c9d ([MIT](https://pgp.mit.edu/pks/lookup?op=get&search=0xD6D447B02B4D4C9D) or [SF](https://sourceforge.net/projects/bleachbit/files/public_key/andrew2019.key/view)). Older releases before BleachBit version 3.0 were signed with [key 0xD6D447B02B4D4C9D](http://bleachbit.sourceforge.net/bleachbit_public.key).

Second, you will need either detached signatures or signed checksums. You do not need both.

There is one detached signature per download. Look in the [SourceForge release directory](https://sourceforge.net/projects/bleachbit/files/bleachbit/) for a folder called `detached_signatures`, and in the folder will be a file with the same name as the download plus the `.sig` extension. For example, the detached signature for `bleachbit_3.0_all_ubuntu1910.deb` is named `bleachbit_3.0_all_ubuntu1910.deb.sig`. Here is an example of how to verfy it.

```
$ gpg --verify bleachbit_3.0_all_ubuntu1910.deb.sig bleachbit_3.0_all_ubuntu1910.deb
gpg: Signature made Sat 26 Oct 2019 08:04:00 AM MDT
gpg:                using RSA key A9E582E4054A159315EDC943D6D447B02B4D4C9D
gpg: Good signature from "Andrew Ziem <ahz001@gmail.com>" [ultimate]
```

Instead of detached signatures, another option is the signed checksums. There is one signed checksum file per version of BleachBit. Verification is a two-step process. In the first step, verify the signature.

```
$ gpg --verify bleachbit-3.0-sha256sum.txt.asc
gpg: Signature made Sat 26 Oct 2019 07:58:09 AM MDT
gpg:                using RSA key A9E582E4054A159315EDC943D6D447B02B4D4C9D
gpg: Good signature from "Andrew Ziem <ahz001@gmail.com>" [ultimate]
gpg: WARNING: not a detached signature; file 'bleachbit-3.0-sha256sum.txt' was NOT verified!
```
Watch for the "Good signature," and ignore the warning.

Second, verify the checksums like this:

```
$ sha256sum -c bleachbit-3.0-sha256sum.txt.asc
bleachbit_3.0_all_debian10.deb: OK
bleachbit_3.0_all_debian8.deb: OK
bleachbit_3.0_all_debian9.deb: OK
bleachbit_3.0_all_ubuntu1404.deb: OK
bleachbit_3.0_all_ubuntu1604.deb: OK
bleachbit_3.0_all_ubuntu1804.deb: OK
bleachbit_3.0_all_ubuntu1810.deb: OK
bleachbit_3.0_all_ubuntu1904.deb: OK
bleachbit_3.0_all_ubuntu1910.deb: OK
BleachBit-3.0-portable.zip: OK
BleachBit-3.0-setup.zip: OK
bleachbit-3.0-1.1.centos7.noarch.rpm: OK
bleachbit-3.0-1.1.centosCentOS-6.noarch.rpm: OK
bleachbit-3.0-1.1.el6.noarch.rpm: OK
bleachbit-3.0-1.1.el7.noarch.rpm: OK
bleachbit-3.0-1.1.fc28.noarch.rpm: OK
bleachbit-3.0-1.1.opensuse423.noarch.rpm: OK
bleachbit-3.0-1.1.sle11.noarch.rpm: OK
BleachBit-3.0-setup-English.exe: OK
BleachBit-3.0-setup.exe: OK
bleachbit-3.0.tar.gz: OK
bleachbit-3.0.tar.bz2: OK
bleachbit-3.0.tar.lzma: OK
sha256sum: WARNING: 17 lines are improperly formatted
```

If you don't download all the files, you will see "No such file or directory errors." Instead, focus on the "OK" for the file you downloaded. Also, ignore the "improperly formatted" warning because sha256sum doesn't recognize lines added by PGP.



