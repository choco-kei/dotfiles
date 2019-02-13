#!/bin/sh

LN_FILES=(nvim)

for file in ${LN_FILES[@]}
do
    if [ -a $HOME/.config/$file ]; then
        echo "既にファイルが存在します: $file"
    else
        ln -s $HOME/dotfiles/config/$file $HOME/.config/$file
        echo "シンボリックリンクを貼りました: $file"
    fi
done
