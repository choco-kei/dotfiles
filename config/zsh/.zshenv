# LANG
# http://curiousabt.blog27.fc2.com/blog-entry-65.html
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# EDITOR
export EDITOR=vim

# disable path_helper
setopt no_global_rcs

# PATH:default
path=(/sbin(N-/) /usr/local/bin(N-/) /Library/Frameworks/Mono.framework/Versions/Current/Commands(N-/) /Applications/Wireshark.app/Contents/MacOS(N-/) $path)
# PATH:local
path=(/usr/local/sbin(N-/) $HOME/bin(N-/) $HOME/local/bin(N-/) /usr/local/git/bin(N-/) $path)
# PATH:Dotfiles
path=($HOME/dotfiles/bin(N-/) $path)
# PATH:Npm
path=(/sbin:/usr/local/share/npm/bin(N-/) $path)
# PATH:Composer
path=($HOME/.composer/vendor/bin(N-/) $path)
# PATH:Golang
path=(/usr/local/opt/go/libexec/bin $path)
# PATH:ruby
path=(/usr/local/opt/ruby/bin $path)
path=(/usr/local/lib/ruby/gems/2.7.0/bin $path)
# PATH:java
# JDK19
#path=(/usr/local/opt/openjdk/bin $path)
# JDK17
#path=(/usr/local/opt/openjdk@17/bin $path)
# JDK11
path=(/usr/local/opt/openjdk@11/bin $path)
# PATH:flutter
path=($HOME/development/flutter/bin $path)

# PATH:nvm
# 遅い?
#export NVM_DIR="$HOME/.nvm"
#[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# 仮の nvm コマンド
nvm() {
  # まず仮の nvm コマンドを unset
  unset -f nvm
  # nvm.sh をロード
  # ここで本物の nvm コマンドが定義される
  source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"
  # 仮の nvm コマンドに渡された引数を本物に受け渡す
  nvm "$@"
}
# あらかじめ `nvm default vX.Y.Z` してエイリアス "default" を作っておく
PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules

# （以下 Zsh のみ）
# $NODE_PATH にバージョン番号が含まれていないと `yo doctor` が警告を出す
# 次のように書くと $NODE_PATH のシンボリックリンクが展開され、警告が出なくなる
# (Hint: .nvm/default は .nvm/vX.Y.Z へのシンボリックリンク)
NODE_PATH=${NODE_PATH:A}

# PATH:PATH:pyenv
export PYENV_ROOT="$HOME/.pyenv"
path=("$PYENV_ROOT/bin" $path)
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# PATH:rbenv
path=($HOME/.rbenv/bin $path)
path=($HOME/.rbenv/shims $path)

# LESS
LESS=-qR

# MANPATH
MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man
export MANPATH

# openssl
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl@1.1/lib/

# Macvim
#alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vimdiff='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/vimdiff'

#tree -N
alias tree='/usr/local/bin/tree -N'

# ls -GF
alias ls='ls -GF'

# gcp
alias cp="gcp"

# svn
export SVN_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim


# zprof
#zmodload zsh/zprof && zprof
