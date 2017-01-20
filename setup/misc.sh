#!/bin/sh

TYPE="misc"
LN_FILES=(.agignore .ctags)

for file in ${LN_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        echo "既にファイルが存在します: $file"
    else
        ln -s $HOME/dotfiles/config/$TYPE/$file $HOME/$file
        echo "シンボリックリンクを貼りました: $file"
    fi
done
