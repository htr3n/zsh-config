#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

#-----------------------------------------------------
# Add colors to ls command
if [ -f "/usr/local/bin/gdircolors"  ] || [ -f "/usr/bin/gdircolors"  ]; then
	eval $( gdircolors -b ${ZSHCONFIG}/lib/dircolors-custom )
fi
