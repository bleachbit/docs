# BleachBit Documentation

This is a Jekyll site built with Ruby gems. Are you a user wanting to learn how to use BleachBit? [Read the documentation.](https://docs.bleachbit.org/)

Otherwise, if you want to build the documentation site, follow the instructions below.

# Build

```sh
sudo apt-get update
sudo apt-get install gnupg2 ruby-full ruby-bundler
sudo apt-get remove ruby-liquid # in case installed earlier
bundle install
bundle exec jekyll serve
bundle exec jekyll build
```

# Help improve

1. Log in to GitHub.
2. Fork this repository to make your own copy.
3. Make the edits in your own repository.
4. Submit a pull request to merge your changes.

# License

The documentation is under the GNU General Public License version 3 or later
