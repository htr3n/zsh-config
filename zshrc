#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

export ZSHCONFIG=${ZDOTDIR:-$HOME}/.zsh-config

ZSH_INIT=${ZSHCONFIG}/_init.sh

if [[ -s ${ZSH_INIT} ]]; then
    source ${ZSH_INIT}
else
    echo "Could not find the init script ${ZSH_INIT}"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
