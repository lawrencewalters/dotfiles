#!/usr/bin/env bash

set -eu

export MSYS=winsymlinks:nativestrict


DOTDIR="/mnt/c/Users/lwalters/dotfiles"
LINUXDIR="/mnt/c/Users/lwalters/dotfiles/linux"
BINDIR="${HOME}/bin"

noisy_link () {
  echo "ln -s \"${1}\" \"${2}\""
  ln -s "${1}" "${2}"
}

cautious_link () {
  if [[ -e "${2}" ]]; then
    echo "skipped: ${2}"
  else
    noisy_link "${1}" "${2}"
  fi
}

# cautious_link_bin () {
#   local name=$(basename "$1")
#   local src="${DOTDIR}/bin/${name}"
#   local dest="${BINDIR}/${name}"
#   if [[ ! -d "${src}" ]]; then
#     cautious_link "${src}" "${dest}"
#   fi
# }

for f in bashrc profile vimrc; do
  cautious_link "${LINUXDIR}/${f}" "${HOME}/.${f}"
done

for f in gitconfig gitignore; do
  cautious_link "${DOTDIR}/${f}" "${HOME}/.${f}"
done

#cautious_link "${DOTDIR}/dotfiles/AppData/Roaming/Code/User/settings.json" "${HOME}/AppData/Roaming/Code/User/settings.json"
#cautious_link "${DOTDIR}/dotfiles/AppData/Roaming/ConEmu.xml" "${HOME}/AppData/Roaming/ConEmu.xml"

#TODO: keypirinha, C:\Users\lwalters\AppData\Roaming\Keypirinha\User, C:\Users\lwalters\AppData\Roaming\Notepad++
#for x in ./bin/*; do
#  cautious_link_bin "${x}"
#done

#install_vim_vundle
