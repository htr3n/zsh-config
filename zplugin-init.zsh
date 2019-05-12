#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

# https://github.com/zdharma/zplugin/wiki
# https://github.com/zdharma/zplugin/blob/master/GALLERY.md
zplugin ice wait"0" atload"_zsh_autosuggest_start" lucid
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait"0" lucid
zplugin light zsh-users/zsh-completions


zplugin ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
#zplugin light zsh-users/zsh-syntax-highlighting
zplugin light zdharma/fast-syntax-highlighting

zplugin ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh" lucid
zplugin light direnv/direnv

#zplugin ice wait"0" lucid
# must load it otherwise bindkeys won't work
zplugin light zsh-users/zsh-history-substring-search

zplugin ice wait"0" lucid
zplugin load zdharma/history-search-multi-word

zplugin ice wait"0" lucid
zplugin light junegunn/fzf

#zplugin light mafredri/zsh-async
# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh" lucid; zplugin light sindresorhus/pure

# https://github.com/laggardkernel/git-ignore
zplugin ice pick'init.zsh' blockf
zplugin light laggardkernel/git-ignore
alias gi="git-ignore"
