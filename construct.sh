#!/bin/bash

function doone(){
  echo "DONE:" $1
}

function make_link(){
  ln -sf `pwd`/$1 ~/$1
  doone $1
}

make_link .zshrc
make_link .bashrc
make_link .screenrc
make_link .sbclrc
make_link .vimrc
make_link .vim
make_link .oh-my-zsh
make_link .Xmodmap

ln -sf `pwd`/init.el ~/.emacs.d/init.el
ln -sf `pwd`/elisp ~/.emacs.d/elisp
ln -sf `pwd`/slime ~/.emacs.d/slime
ln -sf `pwd`/magit ~/.emacs.d/magit
ln -sf `pwd`/git-modes ~/.emacs.d/git-modes
ln -sf `pwd`/auto-complete ~/.emacs.d/auto-complete
ln -sf `pwd`/ac-dict ~/.emacs.d/ac-dict
ln -sf `pwd`/snippets ~/.emacs.d/snippets

sudo mkdir /usr/local/git/contrib/completion/
sudo mv `pwd`/git-completion.bash /usr/local/git/contrib/completion
sudo mv `pwd`/git-prompt.sh /usr/local/git/contrib/completion
source /usr/local/git/contrib/completion/git-completion.git
GIT_PS1_SHOWDIRTYSTATE=true
