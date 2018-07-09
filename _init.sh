# vim:syntax=sh
# vim:filetype=sh

#-----------------------------------------------------
# Only zsh specific stuffs
[ ! -n "$ZSH_VERSION" ] && return

export SCRIPTS=${HOME}/scripts

function check_and_source(){
	if [[ -f "$1" ]]; then
		source "$1"
	else
		echo "Could not source file $1."
	fi
	return
}

function quiet_check_and_source(){
	[[ -f "$1" ]] && source "$1"
}

#-----------------------------------------------------
# check whether a command exists,
# if exists, return 0, otherwise return -1
function command_exists(){
    if [[ $# -ne 1 ]]; then
        echo "Usage $0 command"
    else
        command -v $1 >/dev/null 2>&1 && echo "YES" && return 0
    fi
    return -1
}

#-----------------------------------------------------
check_and_source ${ZSHCONFIG}/completion.sh
check_and_source ${ZSHCONFIG}/dropbox.sh
check_and_source ${ZSHCONFIG}/macos.sh
check_and_source ${ZSHCONFIG}/prompts.sh
check_and_source ${ZSHCONFIG}/system.sh
check_and_source ${ZSHCONFIG}/tex.sh
check_and_source ${ZSHCONFIG}/updates.sh
check_and_source ${ZSHCONFIG}/vim.sh
check_and_source ${ZSHCONFIG}/virtualbox.sh

eval $( gdircolors -b ${ZSHCONFIG}/dircolors-custom )

#
# Development stuffs
check_and_source ${SCRIPTS}/dev-config/_init.sh

#-----------------------------------------------------
# ZSH customisations
check_and_source ${ZSHCONFIG}/zsh-custom.sh

#-----------------------------------------------------
# after all, set the PATH for macOS
if [[ -x /bin/launchctl ]]; then
    /bin/launchctl setenv PATH $PATH
fi

#
# Some private stuffs, if any
quiet_check_and_source ${HOME}/.private.sh

#
# direnv
# https://github.com/direnv/direnv
# brew install direnv
#eval "$(direnv hook zsh)"

#-----------------------------------------------------
# zsh-syntax-highlighting must be sourced at the very end
#
# https://github.com/zsh-users/zsh-syntax-highlighting
#
check_and_source ${ZSHCONFIG}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
