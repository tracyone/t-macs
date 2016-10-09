#!/bin/bash
# install script for emacs confg 
# usage:./install.sh [c]
# arg c mean use copy instead of ln

if [[ $# -eq 1 || $1 == "c" ]]; then
    install_cmd="cp -rf"
else
    install_cmd="ln -sf"
fi

echo -e "\nStart ${install_cmd} ...\n"

mkdir ~/.emacs.d/lisp -p || exit 1

el_files=$(find ./lisp -name "*.el")

for i in ${el_files}; do
    ${install_cmd} $(pwd)/$i ~/.emacs.d/lisp || exit 2
done

${install_cmd} $(pwd)/init.el ~/.emacs.d || exit 3

echo -e "Install finisih, happy hacking emacs!"


