#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Execute code in the background to not affect the current session
{
# Compile zcompdump, if modified, to increase startup speed.
    ZCOMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "$ZCOMPDUMP" && (! -s "${ZCOMPDUMP}.zwc" || "$ZCOMPDUMP" -nt "${ZCOMPDUMP}.zwc") ]]; then
        zcompile "$ZCOMPDUMP"
    fi
} &!