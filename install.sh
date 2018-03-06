#!/usr/bin/env bash

set -eu

export MSYS=winsymlinks:nativestrict

DOTDIR="${HOME}/dotfiles"
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

for f in gitconfig bashrc; do
  cautious_link "${HOME}/dotfiles/${f}" "${HOME}/.${f}"
done

cautious_link "${HOME}/dotfiles/AppData/Roaming/Code/User/settings.json" "${HOME}/AppData/Roaming/Code/User/settings.json"

#for x in ./bin/*; do
#  cautious_link_bin "${x}"
#done

#install_vim_vundle