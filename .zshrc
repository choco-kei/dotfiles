# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

## Default shell configuration
# colors enables us to idenfity color by $fg[red].
autoload colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    #
    # Color
    #
    DEFAULT=$'%{\e[1;0m%}'
    RESET="%{${reset_color}%}"
    GREEN="%{${fg[green]}%}"
    BLUE="%{${fg[blue]}%}"
    RED="%{${fg[red]}%}"
    CYAN="%{${fg[cyan]}%}"
    WHITE="%{${fg[white]}%}"
    POH="$"

    #
    # Prompt
    #
    PROMPT='%{$fg_bold[blue]%}${USER}@%m${RESET}${WHITE}${POH} ${RESET}'
    RPROMPT='${RESET}${WHITE}[${BLUE}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${RESET}'

    #
    # Vi入力モードでPROMPTの色を変える
    # http://memo.officebrook.net/20090226.html
    function zle-line-init zle-keymap-select {
      case $KEYMAP in
        vicmd)
        PROMPT="%{$fg_bold[cyan]%}${USER}@%m${RESET}${WHITE}${POH} ${RESET}"
        ;;
        main|viins)
        PROMPT="%{$fg_bold[blue]%}${USER}@%m${RESET}${WHITE}${POH} ${RESET}"
        ;;
      esac
      zle reset-prompt
    }
    zle -N zle-line-init
    zle -N zle-keymap-select

    # Show git branch when you are in git repository
    # http://d.hatena.ne.jp/mollifier/20100906/p1
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git svn hg bzr
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true

    autoload -Uz is-at-least
    if is-at-least 4.3.10; then
      # この check-for-changes が今回の設定するところ
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
      zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
      zstyle ':vcs_info:git:*' formats '(%s)-[%c%u%b]'
      zstyle ':vcs_info:git:*' actionformats '(%s)-[%c%u%b|%a]'
    fi

    function _update_vcs_info_msg() {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        psvar[2]=$(_git_not_pushed)
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    }
    add-zsh-hook precmd _update_vcs_info_msg

    # show status of git pushed to HEAD in prompt
    function _git_not_pushed()
    {
      if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
        head="$(git rev-parse HEAD)"
        for x in $(git rev-parse --remotes)
        do
          if [ "$head" = "$x" ]; then
            return 0
          fi
        done
        echo "|?"
      fi
      return 0
    }

    # git のブランチ名 *と作業状態* を zsh の右プロンプトに表示＋ status に応じて色もつけてみた - Yarukidenized:ヤルキデナイズド :
    # http://d.hatena.ne.jp/uasi/20091025/1256458798
    autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

    function rprompt-git-current-branch {
      local name st color gitdir action pushed
      if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
              return
      fi

      name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
      if [[ -z $name ]]; then
              return
      fi

      gitdir=`git rev-parse --git-dir 2> /dev/null`
      action=`VCS_INFO_git_getaction "$gitdir"` && action="|$action"
      pushed="`_git_not_pushed`"

      st=`git status 2> /dev/null`
      if [[ "$st" =~ "(?m)^nothing to" ]]; then
        color=%F{green}
      elif [[ "$st" =~ "(?m)^nothing added" ]]; then
        color=%F{yellow}
      elif [[ "$st" =~ "(?m)^# Untracked" ]]; then
        color=%B%F{red}
      else
        color=%F{red}
      fi

      echo "[$color$name$action$pushed%f%b]"
    }

    # PCRE 互換の正規表現を使う
    setopt re_match_pcre

    RPROMPT='`rprompt-git-current-branch`${RESET}${WHITE}[${BLUE}%(5~,%-2~/.../%2~,%~)${WHITE}]${RESET}'

    ;;
esac


# cd無しでディレクトリに移動
setopt auto_cd

# 自動でpushdする
setopt auto_pushd

# pushdで同じディレクトリをpushしない
setopt pushd_ignore_dups

# コマンドのスペルチェック
setopt correct

# コマンド以外も全てスペルチェック
setopt correct_all

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

# 強力な補完を有効にする
autoload -Uz compinit
compinit

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

cons25)
    unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad

    export LS_COLORS='di=01;32:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30'
    zstyle ':completion:*' list-colors \
        'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;

kterm*|xterm*)
   # Terminal.app
#    precmd() {
#        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#    }
    # export LSCOLORS=exfxcxdxbxegedabagacad
    # export LSCOLORS=gxfxcxdxbxegedabagacad
    # export LS_COLORS='di=1;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30'

    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad

    zstyle ':completion:*' list-colors \
        'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;

dumb)
    echo "Welcome Emacs Shell"
    ;;
esac

