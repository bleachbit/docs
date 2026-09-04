# BleachBit Documentation

This is a Jekyll site built with Ruby gems. Are you a user wanting to learn how to use BleachBit? [Read the documentation.](https://docs.bleachbit.org/)

Otherwise, if you want to build the documentation site, follow the instructions below.

# Build

```sh
sudo apt-get update
sudo apt-get install gnupg2 ruby-full ruby-bundler
sudo apt-get remove ruby-liquid # in case installed earlier
bundle config set --local path vendor/bundle # optional
bundle install
bundle exec jekyll serve
bundle exec jekyll build
```

# Build with Docker

To skip installing Ruby and gems locally, use Docker or Podman:

```sh
make docker-serve   # serve on http://127.0.0.1:4000
make docker-build   # build static site into _site/
make docker-shell   # shell in the container
make docker-down    # stop the container
```

The first run writes `.env` with your host uid/gid, so generated files
are owned by you.

# Help improve

1. Log in to GitHub.
2. Fork this repository to make your own copy.
3. Make the edits in your own repository.
4. Submit a pull request to merge your changes.


# Style guide

## Writing style

- Use sentence case for all headings.
- Avoid em-dashes; use commas, colons, or rewrite the sentence.
- Use the Oxford comma.
- Write "for example" instead of "e.g."
- Write "that is" instead of "i.e."
- Omit "Microsoft" when referring to Windows.

## UI instructions

- Bold UI elements the user clicks, selects, or toggles:
  - buttons: click **Delete**
  - menu items: go to **Edit > Preferences**
  - tabs, labels, checkboxes: select the **Custom** tab
- Code for text the user types: type `bleachbit --list`
- Describe the action in plain English first, UI element second:
  - yes: click **Shred files**
  - no: **Shred files** should be clicked
- Use "click" for buttons, "select" for menus/dropdowns,
  "check"/"uncheck" for checkboxes, "type" for keyboard input
- Code for keyboard shortcuts: press `Ctrl+Z`, press `Shift+Delete`
  - Use `+` to join keys, no spaces
  - Capitalize key names: `Ctrl`, `Shift`, `Alt`, `Enter`, `Delete`

## Headings

- Set `title` and optionally `subtitle` in the front matter;
  the template renders both: do not repeat them in the body
- Use `subtitle` for a tagline or scope note (one sentence max;
  okay to omit).
- Do not write `#` (h1) in the body: the template renders it
  from `page.title`.
- Start body headings at `##` (h2), then `###` (h3).
- Do not skip levels (no h2 → h4).
- Use sentence case for both title and subtitle (in front matter)
  and for body headings: `## Limits to know`, not `## Limits To Know`

## Horizontal rules

- Use `---` only for major structural breaks, not between every section
- Do not use `---` immediately after a heading

## Formatting

- Use `-` for unordered lists, not `*`.
- Use numbered lists for steps or sequences.
- Use bullet lists for items that don't need numbering.
- Wrap long lines to keep diffs readable.

## Capitalization of proper nouns

- BleachBit: always CamelCase
- Winapp2: capitalized when referring to the community project
- `winapp2.ini`: always lowercase in code ticks; it is a filename
- Windows, Linux, macOS: follow each platform's own styling

# License

The documentation is under the GNU General Public License version 3 or later
