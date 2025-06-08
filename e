#!/bin/sh

echo $WINDOW > ~/.emacs.d/emacsclient-caller
if [ -f ~/.emacs.d/emacs-server-window ]; then
  screen -X select `cat ~/.emacs.d/emacs-server-window`
fi
emacsclient -n "$1"
