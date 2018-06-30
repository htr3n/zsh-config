#!/usr/bin/env sh
# vim:syntax=sh
# vim:filetype=sh

#
# Helper Functions
# http://apple.stackexchange.com/a/96810/7647
#
update() {
	local brew="echo ; echo 'UPDATING HOMEBREW'; echo ; brew update; brew upgrade; brew cleanup;"
	local fzf="echo ; echo 'UPDATING fzf'; echo ; (cd ~/.fzf; git pull);"
	#local zsh_autosuggestions="echo ; echo 'UPDATING zsh-autosuggestions'; echo ; cd ${ZSHCONFIG}/zsh-autosuggestions; git pull;"
	#local zsh_history_substring_search="echo ; echo 'UPDATING zsh-history-substring-search'; echo ; cd ${ZSHCONFIG}/zsh-history-substring-search; git pull;"
	#local zsh_completions="echo ; echo 'UPDATING zsh-completions'; echo ; cd ${ZSHCONFIG}/zsh-completions; git pull;"
	#local prezto="echo ; echo 'UPDATING PREZTO'; echo ; cd ${HOME}/.zprezto; git pull && git submodule update --init --recursive ;"
	#local texlive="echo ; echo 'UPDATING TeXLive'; echo ; tlmgr update --all --self"
	#local gem="gem update;"
	#local pip3="pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip3 install -U -q"
	local zshconfig="echo ; echo 'UPDATING ZSH-CONFIG'; echo ; cd ${HOME}/.zsh-config; git pull && git submodule update --init --recursive ;"
	sh -c $brew$fzf$zshconfig
}
