# vim:syntax=sh
# vim:filetype=sh

# Homebrew et al.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# When Cellar and TEMP directories are on different volumes,
# OS X won't move relative symlinks across volumes unless the
# target file already exists. Brews known to be affected by
# this are Git and Narwhal.

# export HOMEBREW_TEMP=$HOME/tmp
# export HOMEBREW_TEMP=$HOME/tmp/homebrew
# export HOMEBREW_BUILD_FROM_SOURCE=1

#
# https://docs.brew.sh/Analytics.html
#
export HOMEBREW_NO_ANALYTICS=1

# Homebrew will not auto-update before running brew install/upgrade/tap.
export HOMEBREW_NO_AUTO_UPDATE=1


alias cask='brew cask '
alias cask.cleanup='cask cleanup'
alias cask.doctor='cask doctor'
alias cask.search='cask search'
alias cask.install='cask install'
alias cask.uninstall='cask uninstall'
alias cask.zap='cask zap'

alias brew.edit='brew edit '
alias brew.cat='brew cat '
alias brew.cleanup='brew cleanup '
alias brew.doctor='brew doctor '
alias brew.info='brew info '
alias brew.install='brew install '
alias brew.install.head='brew install --HEAD '
alias brew.list='brew list '
alias brew.link='brew link '
alias brew.options='brew options '
alias brew.options.all='brew options --all'
alias brew.options.installed='brew options --installed'
alias brew.search='brew search '
alias brew.search.desc='brew search -desc '
alias brew.prune='brew prune '
alias brew.remove='brew remove '
alias brew.tap='brew tap '
alias brew.tap_list='brew tap --list-official '
alias brew.untap='brew untap '
alias brew.services.list='brew services list '
alias brew.services.run='brew services run '
alias brew.services.start='brew services start '
alias brew.services.stop='brew services stop '
alias brew.services.restart='brew services restart '
alias brew.services.cleanup='brew services cleanup'
alias brew.update='brew update && brew upgrade'
alias brew.unlink='brew unlink '

function homebrew.install(){
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/homebrew/install/master/install)"
}

function homebrew.uninstall(){
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
}

BUNDLE_FILE=${ZSHCONFIG}/Brewfile

function brew.backup(){
    echo "Backing up Homebrew installation ..."
    ( cd $ZSHCONFIG; brew tap Homebrew/bundle; brew bundle dump --force )
    echo "Done!"
}

function brew.restore(){
    echo "Restoring Homebrew installation"
    ( cd $ZSHCONFIG; brew bundle )
    echo "Done!"
}


