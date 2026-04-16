# ビープを鳴らさない
set -g bell_style none

# vim-mode: on
if not set -q fish_key_bindings
    set -U fish_key_bindings fish_vi_key_bindings
end

# ユーザーキーバインド
function fish_user_key_bindings
    # fzf: on
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end

    # vim-mode: c-p, c-n でヒストリー検索(前方一致)
    bind -M insert \cp history-prefix-search-backward
    bind -M insert \cn history-prefix-search-forward

    # vim-mode: c-y で候補確定
    bind -M insert \cy accept-autosuggestion
end

# abbreviation
if status is-interactive
    abbr -a rl 'source ~/.config/fish/config.fish'
end
