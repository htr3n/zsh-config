#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# system executables
#export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
# local system binaries
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# Setting autoloaded functions
#
my_zsh_fpath=${ZSHCONFIG}/autoloaded

fpath=($my_zsh_fpath $fpath)

if [[ -d "$my_zsh_fpath" ]]; then
    for func in $my_zsh_fpath/*; do
        autoload -Uz ${func:t}
    done
fi
unset my_zsh_fpath

#-----------------------------------------------------
#
# Antibody: Load the plugins before scripts
#
#source ${ZSHCONFIG}/antibody-init.zsh
#
#
#source ${ZSHCONFIG}/zsh-managed-plugins.zsh
#
#-----------------------------------------------------

#-----------------------------------------------------
#
source ~/.zplugin/bin/zplugin.zsh

# where plugins are loaded
source ~/.zsh-config/zplugin-init.zsh
#
#-----------------------------------------------------

# https://github.com/sindresorhus/pure#options
export PURE_PROMPT_SYMBOL='λ'

#
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$my_zsh_lib" ]]; then
   for file in $my_zsh_lib/*.zsh; do
      source $file
   done
fi
unset my_zsh_lib



#-----------------------------------------------------
# Development stuffs
dev_config_init=${SCRIPTS}/dev-config/_init.sh

[[ -f "$dev_config_init"  ]] && source "$dev_config_init"

unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH
