#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

# http://disq.us/p/f55b78
setopt noglobalrcs

[[ -s ${ZDOTDIR:-$HOME}/.zprofile ]] && source ${ZDOTDIR:-$HOME}/.zprofile

# Home-made scripts
export PATH=$PATH:${HOME}/.bin
