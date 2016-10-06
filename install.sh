#!/bin/bash
# install script for emacs confg 
mkdir ~/.emacs.d/lisp -p || exit 3

ln -sf $(pwd)/custom.el ~/.emacs.d/lisp
ln -sf $(pwd)/init-keybinding.el ~/.emacs.d/lisp
ln -sf $(pwd)/init-better-default.el ~/.emacs.d/lisp
ln -sf $(pwd)/init-ui.el ~/.emacs.d/lisp
ln -sf $(pwd)/init-org.el ~/.emacs.d/lisp
ln -sf $(pwd)/init-packages.el ~/.emacs.d/lisp
ln -sf $(pwd)/init.el ~/.emacs.d
