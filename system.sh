# vim:syntax=sh
# vim:filetype=sh

#
# Define common system-wide configurations, commands, aliases
# Note that macOS specifics are separate in macos.sh

# system executables
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec


alias ps.ef='ps -ef'

alias tailf='tail -f '

##################################################################################################
# https://github.com/myfreeweb/dotfiles/blob/master/zsh/zshrc
#
# make a dir and change to that dir
#
mcd() { mkdir -p $1 && cd $1; }
mdown() { pandoc -s -f markdown -t man "$*" | mandoc | less } # read markdown files like manpages
##################################################################################################

#
# Get colors in manual pages
man() {
	env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

#
# http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up
# -------------------------------------------------------------------
# compressed file expander
# (from https://github.com/myfreeweb/zshuery/blob/master/zshuery.sh)
# -------------------------------------------------------------------
ex() {
	if [[ -f $1 ]]; then
		case $1 in
		  *.tar.bz2) tar xvjf $1;;
		  *.tar.gz) tar xvzf $1;;
		  *.tar.xz) tar xvJf $1;;
		  *.tar.lzma) tar --lzma xvf $1;;
		  *.bz2) bunzip $1;;
		  *.rar) unrar $1;;
		  *.gz) gunzip $1;;
		  *.tar) tar xvf $1;;
		  *.tbz2) tar xvjf $1;;
		  *.tgz) tar xvzf $1;;
		  *.zip) unzip $1;;
		  *.Z) uncompress $1;;
		  *.7z) 7z x $1;;
		  *.dmg) hdiutul mount $1;; # mount OS X disk images
		  *) echo "'$1' cannot be extracted via >ex<";;
	esac
	else
		echo "'$1' is not a valid file"
	fi
}

#
# Network
#
# show open IP4 connections
sys.open.ip4() {
	lsof -Pnl +M -i4
}

# show listening ports
sys.open.port() {
	lsof -i -P | grep -i 'listen'
}

#
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


# A recursive, case-insensitive grep that excludes binary files
dgrep() {
    grep -iR "$@" * | grep -v "Binary"
}

# A recursive, case-insensitive grep that excludes binary files
# and returns only unique filenames
dfgrep() {
    grep -iR "$@" * | grep -v "Binary" | sed 's/:/ /g' | awk '{ print $1 }' | sort | uniq
}

psgrep() {
    if [ ! -z $1 ] ; then
        ps aux | grep $1 | grep -v grep
    else
        echo "!! Need name to grep for"
    fi
}



# -------------------------------------------------------------------
# console function
# -------------------------------------------------------------------
function sys.console () {
  if [[ $# > 0 ]]; then
	query=$(echo "$*"|tr -s ' ' '|')
	tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
	tail -f /var/log/system.log
  fi
}

function empty.file(){
	if [ ! "$#" -gt 0 ] ; then
	  echo "Usage: $0 file1 file2 ..." >&2
	  return -1
	fi
	for file in $@; do
		if [ -f $file ] ; then
			echo "Emptying $file ..."
			cp /dev/null $file
		fi
	done
	echo 'Done!'
	return
}


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


function sys.clean.old.logs(){
	sudo rm -vf /var/log/*.[0-9].*
	sudo rm -vf /var/log/*.[0-9]
}


function delete.line.from.file(){
	if [[ $# -ne 2 ]]; then
		echo "Usage: $0 pattern file"
		exit 1
	else
		if [[ -f /usr/local/bin/sed ]]; then
			LC_ALL=C /usr/local/bin/sed -i "/$1/d" $2
		elif [[ -f /usr/local/bin/gsed ]]; then
			LC_ALL=C /usr/local/bin/gsed -i "/$1/d" $2
		elif [[ -f /usr/bin/sed ]]; then
			LC_ALL=C sed -i '' "/$1/d" $2
		fi
	fi
}

function delete.line.from.history(){
	if [[ $# -ne 1 ]]; then
		echo "Usage: $0 pattern"
	else
		delete.line.from.file $1 $HISTFILE
	fi
}

# Change directory to the current Finder directory
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# -------------------------------------------------------------------
# display a neatly formatted PATH content
# -------------------------------------------------------------------
path() {
  echo $PATH | tr ":" "\n" | \
	awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
		   sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
		   sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
		   sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
		   sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
		   print }"
}

# -------------------------------------------------------------------
# nice mount (http://catonmat.net/blog/another-ten-one-liners-from-commandlingfu-explained)
# displays mounted drive information in a nicely formatted manner
# -------------------------------------------------------------------
function nicemount() { 
	(echo "DEVICE PATH TYPE FLAGS" && mount | awk '$2="";1') | column -t ; 
}
