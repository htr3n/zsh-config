#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#
# Define common system-wide configurations

# GNU ls aliases
#
alias ls='/usr/local/bin/gls --color=auto'
alias ll='ls -lFh'     			# long (-l), types classify (-F),human readable (-h)
alias l='ll'
alias ls.all='ls -lAFh' 		# long list, show almost all
alias ls.sort.time='ls -tlFh'
alias ls.sort.size='ls -SlFh'
alias ls.dot='ls -ld .*'		# show dot files, list dirs non-recursively (-d)
alias ls.recursive='ls -R'
alias ls.id='ls -nFh'			# show numeric FID and GID (-n)

# diff
alias diff='colordiff'

# change dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../..'

alias df='df -h'

#
# Pipe Aliases
#
alias grep='egrep --color=auto '
alias egrep='egrep --color=auto '
alias L=' | less '
alias G=' | egrep --color=auto '
alias T=' | tail '
alias H=' | head '
alias W=' | wc -l '
alias S=' | sort '

function handle-multi-arguments(){
	if [ ! "$#" -gt 1 ] ; then
	  echo "Usage: $0 file1 file2 ..." >&2
	  return -1
	fi
	for file in $@; do
		if [ -f $file ] ; then
			echo -n $file
		fi
	done
	echo 'Done!'
}

# macOS specific
#
# Check if running on macOS, otherwise stop here
[[ ! "$(uname -s)" == "Darwin" ]] && return

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

# scutil
#
alias sys.get.computername='scutil --get ComputerName'
alias sys.get.localhostname='scutil --get LocalHostName'
alias sys.get.hostname='scutil --get HostName'
alias sys.get.dns='scutil --dns'
alias sys.get.proxy='scutil --proxy'
alias sys.get.network.interface='scutil --nwi'

#
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

alias sys.pkg.list='pkgutil --pkgs'

# show CPU info
alias sys.cpu='sysctl -n machdep.cpu.brand_string'

