# Restore / Backup Homebrew

* [Restore, Clone or Backup your Homebrew Setup](https://tomlankhorst.nl/brew-bundle-restore-backup)
* [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)

```sh
# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# tap bundle
brew tap Homebrew/bundle

# dump all existing Homebrew packages to Brewfile
brew bundle dump --force

# uninstall formulas not in the list
brew bundle cleanup --force

# check for upgrading
brew bundle check

# list
brew bundle list
brew bundle list --casks
brew bundle list --mas
brew bundle list --brews

# restore
brew bundle
```


