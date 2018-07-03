#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

#
# check whether zsh is use (https://stackoverflow.com/a/9911082/339302)
#
[ ! -n "$ZSH_VERSION" ] && return

#
# Disable the built-in command `r`
#
disable r

#########################################################################################
#
### Init ###
autoload -U promptinit
promptinit

# https://raw.githubusercontent.com/sorin-ionescu/prezto/master/modules/directory/init.zsh
# activate autocd to allow change to a dir via its name
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.
#
# http://blog.patshead.com/2012/11/automatically-expaning-zsh-global-aliases---simplified.html
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

#
# ZSH HISTORY
#
# history file
export HISTFILE=~/.history
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE
#
setopt EXTENDED_HISTORY			    # write in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST   # allow dups, but expire old ones when exceeding HISTSIZE
setopt HIST_FIND_NO_DUPS        # don't find duplicates in history
setopt HIST_IGNORE_ALL_DUPS     # ignore duplicate commands
setopt HIST_IGNORE_DUPS         # ignore duplicate commands
setopt HIST_IGNORE_SPACE		    # ignore entries starting with a space
setopt HIST_REDUCE_BLANKS       # leave blanks out
setopt HIST_SAVE_NO_DUPS        # don't save duplicates
setopt INC_APPEND_HISTORY       # write after each command
setopt SHARE_HISTORY            # share history between sessions

#
# Key bindings for searching
#
bindkey -v
bindkey "^[[3~" delete-char
bindkey "^K" kill-whole-line                      # ctrl-k
bindkey "^R" history-incremental-search-backward  # ctrl-r
bindkey "^A" beginning-of-line                    # ctrl-a
bindkey "^E" end-of-line                          # ctrl-e
bindkey "[B" history-search-forward               # down arrow
bindkey "[A" history-search-backward              # up arrow
bindkey "^D" delete-char                          # ctrl-d
bindkey "^F" forward-char                         # ctrl-f
bindkey "^B" backward-char                        # ctrl-b


#
# HISTORY SUBSTRING SEARCH
# https://github.com/zsh-users/zsh-history-substring-search
check_and_source ${ZSHCONFIG}/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#
# https://github.com/zsh-users/zsh-autosuggestions
#
check_and_source ${ZSHCONFIG}/zsh-autosuggestions/zsh-autosuggestions.zsh

#
# https://github.com/zsh-users/zsh-completions
#
fpath=(${ZSHCONFIG}/zsh-completions/src $fpath)

#
# FUZZY SEARCH
# https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh
# brew install fzf
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
check_and_source ${ZDOTDIR:-$HOME}/.fzf.zsh

# https://github.com/nvbn/thefuck
eval $(thefuck --alias)

#
# Turn off warning "file exists" when overriding by >
#
setopt CLOBBER
