#!/bin/sh

LN_FILES=(.vimrc .gvimrc .agignore .ctags .zsh .zshenv .zshrc bin)

for file in ${LN_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    echo "既にファイルが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
