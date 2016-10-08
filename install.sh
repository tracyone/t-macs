#!/bin/bash
# install script for emacs confg 
mkdir ~/.emacs.d/lisp -p || exit 3

el_files=$(find . -name "*.el")

for i in ${el_files}; do
    ln -sf $(pwd)/$i ~/.emacs.d/lisp
done
