#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# for profiling zsh
#
# zmodload zsh/zprof

export SCRIPTS=${HOME}/scripts

export ZSHCONFIG=${ZDOTDIR:-$HOME}/.zsh-config

ZSH_INIT=${ZSHCONFIG}/_init.sh

if [[ -s ${ZSH_INIT} ]]; then
    source ${ZSH_INIT}
else
    echo "Could not find the init script ${ZSH_INIT}"
fi

#
# enable auto completion
# https://gist.github.com/ctechols/ca1035271ad134841284
# 
#autoload -Uz compinit 
#if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
#	compinit;
#else
#	compinit -C;
#fi;

#
# https://carlosbecker.com/posts/speeding-up-zsh
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
    compinit
else
    compinit -C
fi