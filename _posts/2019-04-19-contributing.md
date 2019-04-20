---
layout: page
title: "Contributing"
category: cml
date: 2000-01-01 00:00:00
---

Write your own cleaners to use yourself and to share with others. These cleaners define which files to delete or perform some other action.  BleachBit includes one cleaner each for Firefox, Google Chrome, and so on.

### Writing the cleaner

First, follow the [CleanerML documentation](/cml/cleanerml.html) for technical instructions on writing the cleaner.


### Testing the cleaner
Backup any files which may be deleted before testing. Then, use this checklist for testing your cleaner:

* BleachBit should not delete settings that the user may regret.
* BleachBit is not an uninstaller.
* Each option accurately describes what it will delete.  For example, an option labeled "logs" should not delete cache.
* The descriptions are generic and reuse strings, so translators have less work.  For example, Firefox should simply be labeled "Web browser" instead of "A popular, fast, free web browser." Look at other cleaners to see which strings they use.
* Use [variables](/cml/variables.html) rather than hard-coding paths.
* Run BleachBit in a console window (`bleachbit_console.exe` on Windows) to check for any warnings.

### Submitting the cleaner
To share the cleaner with others, submit it for review:

* Do not submit cleaners as your own in which you copied and pasted other's work.  You must own the copyright.
* You must license the cleaner under the GNU General License Version 3 or later.
* Submit the cleaner to [cleanerml on GitHub](https://github.com/az0/cleanerml) as an issue (with a link to a gist) or pull request.
* Identify the platform you tested (for example, Ubuntu 9.04 or Windows Vista).
* Identify the application version tested (for example, Firefox 3.0.10).
* (optional) Describe how much space each option cleans. For example, "the log option deleted 2KB."
* (optional) Identify the home page of the application.

Then, wait for a review. Until the final publication, remember you can add the cleaner to your own collection for immediete use in BleachBit.


### Reviewing a cleaner

Help review another person's cleaner submission.  Because there are so many applications, versions of applications, differences in operating systems, etc., the help of the community is essential.

Look in [GitHub](https://github.com/az0/cleanerml) and review them

* Be polite.
* Review the testing guidelines, written above.
* Check each option individually.
* In GitHub on the pull request, document your results.  Example reviews:

> "I tested gFTP 2.0.18 on Fedora 10.  The cleaner removed 2KB of logs and 500KB of cache.  It did not remove any settings.  I recommend changing the description from "FTP client" to "File transfer client," so it shares the same description with Azureus for ease of translating. Otherwise I recommend the cleaner for publication."

> "I tested gFTP 2.0.18 on Fedora 10.  It deleted my settings."


