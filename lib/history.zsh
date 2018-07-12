#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#-----------------------------------------------------
# ZSH HISTORY
#
export HISTFILE=${HOME}/.history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
#
setopt EXTENDED_HISTORY			    # write in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when exceeding HISTSIZE
setopt HIST_FIND_NO_DUPS        # do not find duplicates in history
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicate commands
setopt HIST_IGNORE_DUPS         # ignore duplicate commands
setopt HIST_IGNORE_SPACE		    # ignore entries starting with a space
setopt HIST_REDUCE_BLANKS       # leave blanks out
setopt HIST_SAVE_NO_DUPS        # do not save duplicates
setopt INC_APPEND_HISTORY       # write after each command
setopt SHARE_HISTORY            # share history between sessions
