#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

##
# ZSH plugins managed by Zi
# https://github.com/z-shell/zi
# https://wiki.zshell.dev/
# https://wiki.zshell.dev/docs/getting_started/overview
##

zi ice wait"0" atload"_zsh_autosuggest_start" lucid
zi light zsh-users/zsh-autosuggestions

zi ice wait"0" lucid
zi light zsh-users/zsh-completions

zi ice wait"0" atinit"zpcompinit; zpcdreplay" lucid
zi light zdharma-continuum/fast-syntax-highlighting

zi from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
    direnv/direnv

zi light zsh-users/zsh-history-substring-search

zi ice wait"0" lucid
zi load htr3n/history-search-multi-word

zi ice from"gh-r" as"program"
zi light junegunn/fzf

# Load the pure theme, with zsh-async library that's bundled with it
zi ice pick"async.zsh" src"pure.zsh"
zi light sindresorhus/pure

zi ice as"completion" lucid
zi snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# https://github.com/laggardkernel/git-ignore
zi ice pick'init.zsh' blockf
zi light laggardkernel/git-ignore
alias gi="git-ignore"
