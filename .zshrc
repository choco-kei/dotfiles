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
#setopt brace_ccl

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

# 補完時に濁点・半濁点を <3099> <309a> のように表示させない
setopt combining_chars

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
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=(/usr/local/share/zsh-completions ~/.zsh/zsh-completions/src $fpath)

# 自動インクリメンタル補完(incr.zsh)
[ -f ~/.zsh/incr*.zsh ] && source ~/.zsh/incr*.zsh
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=24'

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# sudoも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 色付きで補完する
#zstyle ':completion:*' list-colors di=34 fi=0
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# 親ディレクトリ(..)のあとに/を補完する
zstyle ':completion:*' special-dirs true

# 補完の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list
zstyle ':completion:*:messages' format $'\e[33m%d\e39m'
zstyle ':completion:*:warnings' format $'\e[31mNo matches for:\e[33m %d\e[39m'
#zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:descriptions' format $'\e[33m -- %d --\e[39m'
#zstyle ':completion:*:corrections' format $'\e[33m%B%d \e[31m(errors: %e)%b\e[39m'
zstyle ':completion:*:options' description 'yes'

# 補完で大文字小文字を無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# セパレータを設定する
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

# 補完候補をキャッシュする
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path ~/.zsh/cache

# 補完を有効にする
autoload -U compinit
compinit -u

# git補完が重いので停止
__git_ls_files_helper() {}


###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

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
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
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
readuntil() {
    typeset a
    while [ "$a" != "$1" ]
    do
        read -E -k 1 a
    done
}

showmode() {
    typeset movedown
    typeset row

    movedown=$(($(echo "$RBUFFER" | wc -l)))

    echo -n "\e[6n"
    row="${${$(readuntil R)#*\[}%;*}"

    if [ $((row+movedown)) -gt "$LINES" ]; then
        echo -n "\e[1S"
        echo -n "\e[1A"
    fi

    echo -n "\e[s"
    echo -n "\e[$movedown;E"
    echo -n "\e[${LINES};${movedown}H"
    echo -n "\e[1m"
    if [ -n "$1" ]; then
        echo -n "-- $1 --"
    else
        echo -n "\e[0K"
    fi

    echo -n "\e[0m"
    echo -n "\e[u"
}

function zle-line-init zle-keymap-select {
    vimode="${${KEYMAP/vicmd/NORMAL}/(main|viins)/INSERT}"

    if [ -n "$TMUX" ]; then
        if [ $vimode = "NORMAL" ]; then
            statbg="colour236"
            statfg="colour247"
            hostbg="colour240"
            hostfg="colour231"
            modebg="colour148"
            modefg="colour22"
            weatherbg="colour252"
            weatherfg="colour236"
            batterybg="colour240"
            batteryfg="colour247"
            datebg="colour252"
            datefg="colour236"
        else
            statbg="colour24"
            statfg="colour117"
            hostbg="colour31"
            hostfg="colour231"
            modebg="colour231"
            modefg="colour23"
            weatherbg="colour117"
            weatherfg="colour23"
            batterybg="colour31"
            batteryfg="colour117"
            datebg="colour117"
            datefg="colour23"e
        fi
        tmux set -g status-bg ${statbg} > /dev/null
        tmux set -g status-fg ${statfg} > /dev/null

        host="#[bg=${hostbg}, fg=${hostfg}] #h "
        hosta="#[bg=${statbg}, fg=${hostbg}]⮀"
        mode="#[bg=${modebg}, fg=${modefg}] $vimode "
        modea="#[bg=${hostbg}, fg=${modebg}]⮀"
        tmux set -g status-left "${mode}${modea}${host}${hosta}" > /dev/null

        weather="#[bg=${weatherbg}, fg=${weatherfg}] #($HOME/dotfiles/.tmux/weather.sh) "
        weathera="#[bg=${statbg}, fg=${weatherbg}]⮂"
        battery="#[bg=${batterybg}, fg=${batteryfg}] #($HOME/dotfiles/.tmux/battery.sh) "
        batterya="#[bg=${weatherbg}, fg=${batterybg}]⮂"
        date="#[bg=${datebg}, fg=${datefg}] %Y-%m-%d(%a) %H:%M "
        datea="#[bg=${batterybg}, fg=${datebg}]⮂"
        tmux set -g status-right "${weathera}${weather}${batterya}${battery}${datea}${date}" > /dev/null
    else
        showmode $vimode
    fi
}
zle -N zle-line-init
zle -N zle-keymap-select



# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトのテーマ設定
source ~/dotfiles/.zshrc.theme

