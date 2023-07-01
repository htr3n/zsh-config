#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

#-----------------------------------------------------
# Disable the built-in command `r` for R to work
#
disable r

#-----------------------------------------------------
# https://goo.gl/M3zjNU
# activate autocd to allow change to a dir via its name
setopt auto_cd              # Auto changes to a directory without typing cd.
setopt auto_pushd           # Push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # Do not store duplicates in the stack.
setopt pushd_silent         # Do not print the directory stack after pushd or popd.
setopt pushd_to_home        # Push to home directory when no argument is given.
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
setopt multios              # Write to multiple descriptors.
setopt extended_glob        # Use extended globbing syntax.
#unsetopt clobber           # Do not overwrite existing files with > and >>
                            # Use >! and >>! to bypass.
setopt clobber              # turn off warning "file exists" with > and >>

#-----------------------------------------------------
# Automatically expanding zsh global aliases
# https://goo.gl/fJbtmJ
#
globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias
bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches
