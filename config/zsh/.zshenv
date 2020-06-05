# LANG
# http://curiousabt.blog27.fc2.com/blog-entry-65.html
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# EDITOR
export EDITOR=vim

# disable path_helper
setopt no_global_rcs

# PATH:default
path=(/usr/local/bin(N-/) /Library/Frameworks/Mono.framework/Versions/Current/Commands(N-/) /Applications/Wireshark.app/Contents/MacOS(N-/) $path)
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
# PATH:rbenv
[[ -d ~/.rbenv  ]] && \
    path=($HOME/.rbenv/shims $path)
    eval "$(rbenv init -)"

# LESS
LESS=-qR

# MANPATH
MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man
export MANPATH


# Macvim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vimdiff='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/vimdiff'

#tree -N
alias tree='/usr/local/bin/tree -N'

# ls -GF
alias ls='ls -GF'

# gcp
alias cp="gcp"

# svn
export SVN_EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
