# Disable the greeting message
set -g fish_greeting ""

# Starship
starship init fish | source

# Editor
set -gx EDITOR 'nvim'
set -gx GIT_EDITOR 'nvim'
set -gx VISUAL 'nvim'

# Homebrew
set -gx HOMEBREW_NO_ANALYTICS 1
set -gx HOMEBREW_NO_EMOJI 1

# Locale
set -gx LANG ja_JP.UTF-8
set -gx LESSCHARSET utf-8

# Go
set -gx GOPATH ~/go
set -gx GOROOT ~/sdk/go
set -gx GO111MODULE on

# NVM
set -gx NVM_DIR ~/.nvm
set -gx NVM_LAZY_LOAD true
set -gx NVM_AUTO_USE true

# Node
if status is-interactive
    set -gx NODE_PATH (npm root -g)
end

# FZF
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_DEFAULT_OPTS '--height 40% --reverse --border'

# Terminal colors
set -gx CLICOLOR true
set -gx LSCOLORS exfxcxdxbxegedabagacad
set -gx LS_COLORS 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Docker
test -f ~/.docker/init-fish.sh; and source ~/.docker/init-fish.sh

# ローカル設定ファイルを読み込む (Git管理外)
test -f ~/.local.fish; and source ~/.local.fish
