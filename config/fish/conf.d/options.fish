# ビープを鳴らさない
set -g bell_style none

# vimキーバインドを使用
fish_vi_key_bindings

# alias
if status is-interactive
    abbr -a rl 'source ~/.config/fish/config.fish'
end
