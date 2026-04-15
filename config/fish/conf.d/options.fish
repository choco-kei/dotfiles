# ビープを鳴らさない
set -g bell_style none

# vimキーバインドを使用
fish_vi_key_bindings

# ユーザーキーバインド
function fish_user_key_bindings
    if status is-interactive
        # vim-mode:c-p,c-nでヒストリー検索
        bind -M insert \cp history-token-search-backward
        bind -M insert \cn history-token-search-forward
        # vim-mode:c-yで候補確定
        bind -M insert \cy accept-autosuggestion
    end
end

# abbreviation
if status is-interactive
    abbr -a rl 'source ~/.config/fish/config.fish'
end
