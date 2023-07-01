#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

# For MacOS
if [[ "x$SYSTEM" = "xDarwin"  ]]; then
    # system executables
    #export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
    # local system binaries
    export PATH=/usr/local/sbin:/usr/local/bin:$PATH
fi

#-----------------------------------------------------
# Load zinit
export ZI_HOME_DIR="${HOME}/.zi"
export ZI_BIN_DIR="${ZI_HOME_DIR}/bin"

# and the plugins
if [[ -f "${ZI_BIN_DIR}/zi.zsh" ]]; then
    source "${ZI_BIN_DIR}/zi.zsh"
else
    echo "The Zi init script does not exist at '${ZI_BIN_DIR}/zi.zsh'"
    exit 1
fi
#-----------------------------------------------------

# https://github.com/sindresorhus/pure#options
export PURE_PROMPT_SYMBOL='λ'

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
#
dev_config_init=${SCRIPTS}/dev-config/_init.sh

[[ -f "$dev_config_init"  ]] && source "$dev_config_init"

unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH
