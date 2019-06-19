#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

[[ ! `uname -s` = "Linux" ]] && return

if [[ -s '/etc/zsh_command_not_found' ]]; then
  source '/etc/zsh_command_not_found'
fi

