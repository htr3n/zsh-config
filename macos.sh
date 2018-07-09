# vim:syntax=sh
# vim:filetype=sh

# Check if running on macOS, otherwise stop here
[[ ! "$OSTYPE" == darwin* ]] && return

# /etc/zprofile is loaded and invokes
# /usr/libexec/path_helper that might slow down start-up.
# Better enter directly the content of /etc/paths.d here

# /etc/paths.d/40-XQuartz
export PATH=$PATH:/opt/X11/bin

# /etc/paths.d/MacGPG2
export PATH=$PATH:/usr/local/MacGPG2/bin

#
# GNU Core Utils
# brew info coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# Home-made scripts
export PATH=$PATH:${HOME}/.bin

#
# ps
#
alias ps.aux='ps aux'
alias ps.a='ps -A'

#
# scutil
#
alias sys.get.computername='scutil --get ComputerName'
alias sys.get.localhostname='scutil --get LocalHostName'
alias sys.get.hostname='scutil --get HostName'
alias sys.get.dns='scutil --dns'
alias sys.get.proxy='scutil --proxy'
alias sys.get.network.interface='scutil --nwi'
#alias sys.set.computer.name='sudo systemsetup -setcomputername'

function sys.set.name(){
    if [[ $# -eq 0 ]]; then
        echo "Usage $0 <hostname>"
        return
    else
        sudo scutil --set ComputerName "$1"
        sudo scutil --set LocalHostName "$1"
        sudo scutil --set HostName "$1"
    fi
}

#
alias sys.uti.reset='lsregister -kill -r -domain local -domain system -domain user ; killall Dock'
alias sys.uti.file='mdls -name kMDItemContentTypeTree '

alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'
#
# OS X's launchctl
#
alias launch.list='launchctl list '
alias launch.load='launchctl load '
alias launch.unload='launchctl unload '
alias launch.getenv='launchctl getenv '
alias launch.start='launchctl start '
alias launch.stop='launchctl stop '

#
# Spotlight / Meta-data indexing (MDS)
#
# https://apple.stackexchange.com/q/87090/7647
# https://apple.stackexchange.com/q/63178/7647
#
alias spotlight.exclusion.show='sudo defaults read /.Spotlight-V100/VolumeConfiguration.plist Exclusions'
alias spotlight.exclusion.add='sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add '

alias spotlight.indexing.stop='sudo launchctl stop com.apple.metadata.mds'
alias spotlight.indexing.start='sudo launchctl start com.apple.metadata.md'
alias spotlight.indexing.restart='spotlight.indexing.stop && spotlight.indexing.start'


#
# Generate UUID
#
alias uuid="uuidgen | tr -d - | tr -d '\n' | tr '[:upper:]' '[:lower:]'  | pbcopy && pbpaste && echo"

#
# Package Helpers
#
function sys.pkg.rm (){
	if [[ $# > 0 ]]; then
		pkgutil --only-files --files $1 | tr '\n' '\0' | xargs -n 1 -0 sudo rm -i
		pkgutil --only-dirs --files $1 | tr '\ n' '\0' | xargs -n 1 -0 sudo rm -ir
		sudo pkgutil --forget $1
	else
		echo "$0 name.pkg"
	fi
}

function sys.pkg.files (){
	if [[ $# > 0 ]]; then
		pkgutil --files $1
	else
		echo "$0 name.pkg"
	fi
}

function sys.pkg.forget (){
	if [[ $# > 0 ]]; then
		sudo pkgutil --forget $1
	else
		echo "$0 name.pkg"
	fi
}

function sys.pkg.list (){
	pkgutil --pkgs
}

#
# Change screenshot formats
#

function sys.screenshot.pdf(){
   defaults write com.apple.screencapture type pdf; killall SystemUIServer
}

function sys.screenshot.png(){
   defaults write com.apple.screencapture type png; killall SystemUIServer
}

function sys.screenshot.jpeg(){
   defaults write com.apple.screencapture type jpg; killall SystemUIServer
}

function sys.screenshot.jpeg200(){
   defaults write com.apple.screencapture type jp2; killall SystemUIServer
}

function sys.screenshot.read(){
   defaults read com.apple.screencapture
}

function sys.screenshot.tiff(){
   defaults write com.apple.screencapture type tiff; killall SystemUIServer
}

#
# show CPU info
#
sys.cpu(){
	sysctl -n machdep.cpu.brand_string
}

# reset menu "Open With..."
sys.reset.openwith(){
	/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user
}

#
# remove .DS_Store files
#
rm.ds.store(){
	find . -name ".DS_Store" -exec rm {} \;
}
