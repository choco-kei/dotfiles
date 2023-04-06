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


# PATH:pyenv
export PYENV_ROOT="$HOME/.pyenv"
path=("$PYENV_ROOT/bin" $path)
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
fi

# rbenv
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
