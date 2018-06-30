# vim:filetype=zsh
#

#
# check whether zsh is use (https://stackoverflow.com/a/9911082/339302)
#
[ ! -n "$ZSH_VERSION" ] && return

####################################
# Set Vi MODE
# VI MODE KEYBINDINGS (ins mode)
####################################
bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line
bindkey -M viins '^r' history-incremental-pattern-search-backward
bindkey -M viins '^s' history-incremental-pattern-search-forward
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^n' down-line-or-history
bindkey -M viins '^y' yank
bindkey -M viins '^w' backward-kill-word
bindkey -M viins '^u' backward-kill-line
bindkey -M viins '^h' backward-delete-char
bindkey -M viins '^_' undo
bindkey -M viins '^x^r' redisplay
bindkey -M viins '\eOH' beginning-of-line       # Home
bindkey -M viins '\eOF' end-of-line             # End
bindkey -M viins '\e[2~' overwrite-mode         # Insert
bindkey -M viins '\ef' forward-word             # Alt-f
bindkey -M viins '\eb' backward-word            # Alt-b
bindkey -M viins '\ed' kill-word                # Alt-d
bindkey -M vicmd '/' vi-history-search-forward
bindkey -M vicmd '?' vi-history-search-backward
bindkey -M vicmd '\e[5~' history-beginning-search-backward # PageUp
bindkey -M vicmd '\e[6~' history-beginning-search-forward # PageDown
