# vim:syntax=sh
# vim:filetype=sh

#
# LaTeX
#
export PATH=/usr/texbin:$PATH

#
# BIBTOOL
#
export BIBTOOLRSC=${HOME}/bin/bibtoolrc

#
#TeX
#
alias pla='pdflatex '
alias xla='xelatex '
alias btx='bibtex '

#
# TEXLIVE
#
alias tmuplist='tlmgr update --list ' 
alias tmupall='tlmgr update --self --all ' 
alias tmshow='tlmgr show ' 
alias tminstall='tlmgr install '
alias tminfo='tlmgr info '
alias tminfolist='tlmgr info --list'
alias tminfoinstalled='tlmgr info --only-installed'
alias tmremove='tlmgr remove '
alias tmsearchfile='tlmgr search --file '
alias tmsearchall='tlmgr search --all '
alias tmsearchglobal='tlmgr search --global '
