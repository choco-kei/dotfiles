#!/bin/sh

LN_FILES=(.gvimrc .vimrc .vim)

for file in ${LN_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        echo "既にファイルが存在します: $file"
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo "シンボリックリンクを貼りました: $file"
    fi
done
