#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

ZSHCONFIG=${HOME}/.zsh-config

ZI_HOME_DIR="${HOME}/.zi"
ZI_BIN_DIR="${ZI_HOME_DIR}/bin"

echo "Cloning zi repository"

mkdir -p "${ZI_HOME_DIR}"

git clone https://github.com/z-shell/zi.git "${ZI_BIN_DIR}"

echo "Link ZSH resource files to '${HOME}'"

ln -srnf "${ZSHCONFIG}/zlogin" "${HOME}/.zlogin"
ln -srnf "${ZSHCONFIG}/zprofile" "${HOME}/.zprofile"
ln -srnf "${ZSHCONFIG}/zshenv" "${HOME}/.zshenv"
ln -srnf "${ZSHCONFIG}/zshrc" "${HOME}/.zshrc"

echo "Done!"
