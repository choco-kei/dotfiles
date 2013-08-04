# LANG
# http://curiousabt.blog27.fc2.com/blog-entry-65.html
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# EDITOR
export EDITOR=vim

# PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH:$HOME/local/bin:/usr/local/git/bin
# PATH:Dotfiles
PATH=$PATH:$HOME/dotfiles/bin
# PATH:Npm
PATH=$PATH:/sbin:/usr/local/share/npm/bin
export PATH

# MANPATH
MANPATH=$MANPATH:/opt/local/man:/usr/local/share/man
export MANPATH


# Macvim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#tree -N
alias tree='/usr/local/bin/tree -N'

# ls -GF
alias ls='ls -GF'

