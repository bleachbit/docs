---
layout: page
title: "Chaff"
subtitle: "Hide private files using decoy data"
nav_title: "Chaff"
category: doc
date: 2019-08-14 20:45:26
order: 11
---
When you delete a file, traces can remain on your storage drive, and
digital forensics tools are designed to find them. BleachBit's **Chaff**
feature gives you an extra layer of protection by flooding your drive
with realistic-looking decoy files, making it far harder for investigators
to locate the data that matters.

## What is chaff?

The term comes from military aviation: aircraft release clouds of metallic
chaff to confuse radar and misdirect guided missiles. BleachBit borrows
this idea for the digital world, generating enough realistic-looking noise
that finding your actual private data becomes like finding a needle in a
haystack.

Chaff files are not empty, not random bytes, and not obviously fake.
BleachBit uses a statistical model called a Markov chain to generate
text that looks like real English at a glance, but is actually meaningless.
This makes chaff much harder for forensic tools to automatically identify
and skip.

## How chaff fits into your privacy strategy

Chaff is a complementary tool, not a replacement for other privacy practices.
Here's how it fits:

| Method | What it does |
|---|---|
| Secure deletion | Removes files so they can't be recovered |
| Encryption | Makes files unreadable without a key |
| Chaff | Buries remaining traces in a sea of decoy data |
| Steganography | Hides data inside other files |

Use chaff when:

- You've deleted sensitive files but want to make forensic recovery harder
- You have private files you're keeping, and want them to be difficult to locate among many decoys
- You want to increase the time and cost of any forensic investigation

> **Tip:** Chaff works best alongside encryption. Even if an investigator
> finds your real files amid the decoys, encryption ensures they can't read them.

## Getting started: how to generate chaff files

1. Install and open BleachBit.
2. Go to the application menu and click **Make Chaff**.
3. Choose an **inspiration model** (see below).
4. Set the **number of files** to generate.
5. Choose the **destination directory**.
6. Click **Generate**.

### Choosing an inspiration model

BleachBit ships with two built-in models:

- **Hillary Clinton Emails**: Based on emails released by the U.S. Department of State.
  Generates files that seem like real email messages.
- **2600: The Hacker Quarterly**: Based on a well-known computer underground magazine.
  Produces text with technical and hacker-culture keywords that may appear interesting
  to forensic keyword scans.

Choose the model whose output best resembles the kind of data you're protecting, or use
both for variety.

## How to delete chaff files

When you're done with chaff files, delete them normally, do not shred them.

- **Shredding** removes all traces, which defeats the purpose.
- **Normal deletion** leaves behind recoverable fragments, which adds to the haystack
  and slows down any investigation.

By default, BleachBit uses normal deletion.

## Advanced: hiding data inside chaff (steganography)

BleachBit doesn't include steganography tools, but you can combine chaff with tools
like **Steghide** or **OpenStego** to hide actual data inside chaff files. An
investigator who encounters thousands of chaff files cannot safely whitelist them:
each one could potentially contain hidden data, forcing a thorough (and expensive)
examination of every file.

---

## Frequently asked questions

### Is chaff foolproof?

No. Chaff is one layer of a defense-in-depth approach. A determined investigator
with enough time and resources may identify and filter out chaff, especially if
it lacks variety or does not resemble your real data. Combine chaff with encryption
and secure deletion for the strongest protection.

### How convincing is BleachBit's chaff?

At a glance, the generated files look like real documents. However, at a closer
look, they are nonsense. They are designed to be good enough to slow down an
investigator, not to fool a human reviewer.

Actual sample from 2600:

> The government says that this constitutes true 'misuse' of computers.

And from the Clinton emails:

> Thx so much influence over diplomacy by shutting out a new uranium
> enrichment plant.

What chaff lacks in realism, it makes up for in volume.

### Why not just use empty or null files?

Null bytes are trivially easy for forensic tools to detect and skip. An empty
haystack does not hide anything.

### Why not use files filled with random data?

Standards like DoD 5220.22-M and NIST 800-88 describe random-data wiping,
while chaff's text more resembles interesting data.

Random wiping generates data that looks like:

> 5q_R<kPi!@AG(q-HkQM{0>32aG3NmL^IM38ItezE#eLo0TOyf

Compare to:

> Around two in the book but not necessarily bad, but it cannot
> resolve political or cultural sources of conflict.

Which one would catch your attention longer?

### What is a Markov chain?

Markov chains date back to 1907 work by Russian mathematician
Andrey Markov.

The application of Markov chains to text generation dates to Claude
Shannon's 1948 paper. Shannon observed that "the resemblance to ordinary
English text increases quite noticeably" as one increases the length of the
Markov chain.

### How does a Markov chain work?

Imagine you have one sentence that you feed into a Markov chain:

"The cat sat on the mat"

The Markov chain would analyze the probability of which words
follow other words. For example, it might determine that "cat" is
followed by "sat" 100% of the time in the input text. Then it would
generate new text based on those probabilities.

The math is simple enough that you can understand it without a PhD.
It would be tedious, but you could generate text using Markov chains
manually.

### Does chaff generation use AI?

No. BleachBit uses Markov chains, which are a much older, simpler, faster,
and more efficient alternative to AI LLMs like ChatGPT for generating large
volumes of text.

### Why not use an AI or LLM to generate chaff?

LLMs produce highly realistic text, but they're slow and expensive at the
volumes needed to generate gigabytes of chaff. Markov chains are fast and
cheap for mass production. You could use an LLM to seed a small set of
high-quality decoy documents and then multiply them using the methods below.

Tip: If sensitivity allows, consider giving the LLM a sample of your
documents, and then prompt it to generate more in the same style while
changing the content. Local AIs like ollama may be a better choice for
sensitive documents.

### Can I generate chaff without special software?

Yes, using a copy-and-paste doubling method:

1. Find or create documents similar to the data you're hiding.
2. Copy them and paste duplicates into the same folder.
3. Select all files (originals and copies) and repeat.

Each cycle doubles the file count. It's fast and requires no extra software,
but the variation is low: once an investigator identifies the original set,
duplicates can be skipped quickly. Combine this with other methods for better
results.

### What about other decoy file tools?

- **[DFGenerator](https://github.com/chribonn/DFGenerator)** (Windows): Copies
  a directory structure and replaces sensitive content with random data. No
  longer maintained.
- **Vovsoft Dummy File Generator**: Creates realistic file containers (PDFs,
  etc.), but the contents are trivially simple (e.g., "hello world"), making
  them easy to identify.
- **Large downloads (Linux kernel ~7 GB, Wikipedia ~20 GB)**: Good if your
  real data is source code or reference articles, respectively, since the
  decoys closely resemble the target data.

### How do forensic investigators counter chaff?

The primary countermeasure is **data winnowing**, a technique that clusters
similar documents together. Given a known sample of either real or fake data,
winnowing helps investigators quickly find more of the same type and separate
it from the rest.

To make chaff more resilient against winnowing, use **high variety** across
the decoy files and ensure they overlap stylistically with your real data.

### What are other names for chaff?

There's no single widely-adopted term. You may also see it called:

- Decoy files, dummy files, or noise files
- Fake documents or junk data
- Digital noise generation

"Disinformation" is false information shared deliberately to deceive or
manipulate and operates at the psychological or social level, not the
technical level. Chaff is a technical countermeasure that is not convincing
at close examination.

"Digital camouflage" more accurately describes steganography, where target
data is hidden *inside* other data.

### Is the Clinton reference a political statement?

No. The collection of emails was chosen for two reasons: it's a large,
publicly available dataset of real professional correspondence that works
well as Markov chain training data, and there's a historical nod. BleachBit
became widely known when it was revealed it was used to wipe Clinton's
emails. In an ironic twist, BleachBit can generate emails inspired by that
collection.

Including that corpus is an acknowledgment of that history, not a political
endorsement or criticism of anyone involved.

---

## Summary

BleachBit's Chaff feature is a practical tool for making digital forensics
investigations slower, harder, and more expensive. It's most effective when
combined with encryption, secure deletion, and a high volume of varied decoy
files. No single privacy tool is foolproof: layering multiple methods gives
you the strongest protection.
