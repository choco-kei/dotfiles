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
[ -f ~/.zsh/incr*.zsh ] && source ~/.zsh/incr*.zsh

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

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトのテーマ設定
source ~/dotfiles/.zshrc.theme

