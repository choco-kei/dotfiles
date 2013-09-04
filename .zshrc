# cd無しでディレクトリに移動
#setopt auto_cd

# 自動でpushdする
setopt auto_pushd

# pushdで同じディレクトリをpushしない
setopt pushd_ignore_dups

# コマンドのスペルチェック
#setopt correct

# コマンド以外も全てスペルチェック
#setopt correct_all

# リダイレクトでファイル上書きの禁止
#setopt no_clobber

# 補完候補リストを詰めて表示
setopt list_packed

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# シンボリックリンクは実体を追うようになる
#setopt chase_links

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除かない
setopt noautoremoveslash

# beepを鳴らさないようにする
setopt nolistbeep
setopt nobeep

# Match without pattern
# ex. > rm *~398
# remove * without a file "398". For test, use "echo *~398"
setopt extended_glob

# ログアウト時にバックグラウンドプロセスをkillしない
setopt no_hup

# vimキーバインドを使用
bindkey -v

# ^P/^Nでヒストリー検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# glob(*)によるインクリメンタルサーチ
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

# ヒストリー設定
HISTFILE=~/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# 登録済コマンド行は古い方を削除
setopt hist_ignore_all_dups

# ヒストリーの共有
setopt share_history

# 余分な空白は詰める
setopt hist_reduce_blanks

# add history when command executed.
setopt inc_append_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

## 補完関連
# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# 自動インクリメンタル補完(incr.zsh)
#[ -f ~/.zsh/incr*.zsh ] && source ~/.zsh/incr*.zsh

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 親ディレクトリ(..)のあとに/を補完する
zstyle ':completion:*' special-dirs true

# 強力な補完を有効にする
autoload -Uz compinit
compinit

## ターミナルのカラー設定
# http://journal.mycom.co.jp/column/zsh/009/index.html
unset LSCOLORS

case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;

kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;

#cons25)
#    export LSCOLORS=ExFxCxDxBxegedabagacad
#    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors \
#        'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
#    ;;

kterm*|xterm*)
    export CLICOLOR=true
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;

esac

# tmux自動起動
#if [ -z "$TMUX" -a -z "$STY" ]; then
#    if type tmux >/dev/null 2>&1; then
#        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#            tmux attach && echo "tmux attached session "
#        else
#            tmux new-session && echo "tmux created new session"
#        fi
#    fi  
#fi

# tmux status
#readuntil() {
#    typeset a
#    while [ "$a" != "$1" ]
#    do
#        read -E -k 1 a
#    done
#}

#showmode() {
#    typeset movedown
#    typeset row
#
#    movedown=$(($(echo "$RBUFFER" | wc -l)))
#
#    echo -n "\e[6n"
#    row="${${$(readuntil R)#*\[}%;*}"
#
#    if [ $((row+movedown)) -gt "$LINES" ]; then
#        echo -n "\e[1S"
#        echo -n "\e[1A"
#    fi
#
#    echo -n "\e[s"
#    echo -n "\e[$movedown;E"
#    echo -n "\e[${LINES};${movedown}H"
#    echo -n "\e[1m"
#    if [ -n "$1" ]; then
#        echo -n "-- $1 --"
#    else
#        echo -n "\e[0K"
#    fi
#
#    echo -n "\e[0m"
#    echo -n "\e[u"
#}

#function zle-line-init zle-keymap-select {
#    vimode="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"
#
#    if [ -n "$TMUX" ]; then
#        if [ $vimode = "NORMAL" ]; then
#            statbg="colour236"
#            statfg="colour247"
#            hostbg="colour240"
#            hostfg="colour231"
#            modebg="colour148"
#            modefg="colour22"
#            weatherbg="colour252"
#            weatherfg="colour236"
#            batterybg="colour240"
#            batteryfg="colour247"
#            datebg="colour252"
#            datefg="colour236"
#        else
#            statbg="colour24"
#            statfg="colour117"
#            hostbg="colour31"
#            hostfg="colour231"
#            modebg="colour231"
#            modefg="colour23"
#            weatherbg="colour117"
#            weatherfg="colour23"
#            batterybg="colour31"
#            batteryfg="colour117"
#            datebg="colour117"
#            datefg="colour23"
#        fi
#        tmux set -g status-bg ${statbg} > /dev/null
#        tmux set -g status-fg ${statfg} > /dev/null
#
#        host="#[bg=${hostbg}, fg=${hostfg}] #h "
#        hosta="#[bg=${statbg}, fg=${hostbg}]⮀"
#        mode="#[bg=${modebg}, fg=${modefg}] $vimode "
#        modea="#[bg=${hostbg}, fg=${modebg}]⮀"
#        tmux set -g status-left "${mode}${modea}${host}${hosta}" > /dev/null
#
#        weather="#[bg=${weatherbg}, fg=${weatherfg}] #($HOME/dotfiles/.tmux/weather.sh) "
#        weathera="#[bg=${statbg}, fg=${weatherbg}]⮂"
#        battery="#[bg=${batterybg}, fg=${batteryfg}] #($HOME/dotfiles/.tmux/battery.sh) "
#        batterya="#[bg=${weatherbg}, fg=${batterybg}]⮂"
#        date="#[bg=${datebg}, fg=${datefg}] %Y-%m-%d(%a) %H:%M "
#        datea="#[bg=${batterybg}, fg=${datebg}]⮂"
#        tmux set -g status-right "${weathera}${weather}${batterya}${battery}${datea}${date}" > /dev/null
#    else
#        showmode $vimode
#    fi
#}
#zle -N zle-line-init
#zle -N zle-keymap-select



# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトのテーマ設定
source ~/dotfiles/.zshrc.theme

