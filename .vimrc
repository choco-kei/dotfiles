"----------------------------------------------------------
" プラグイン読み込み
"----------------------------------------------------------

set nocompatible

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/auto/neobundle.vim
    call neobundle#rc(expand('~/dotfiles/.vim/bundle/auto/'))
endif

"" NeoBundle
NeoBundle 'Shougo/neobundle.vim'


"" unite.vim
NeoBundle 'Shougo/unite.vim'

"" unite outline
NeoBundle 'h1mesuke/unite-outline'

"" itermcolors-vim
" vim syntaxからiTermのカラー設定を作成
NeoBundle 'akiomik/itermcolors-vim'

"" vim-instant-markdown
" マークダウンリアルタイムプレビュー
if has('mac')
    NeoBundle 'suan/vim-instant-markdown'
    "let g:instant_markdown_slow = 1
endif

"" vim-gitgutter
" vitの差分を表示
" windowsで動かないっぽい？
if has('mac')
    NeoBundle 'airblade/vim-gitgutter'
endif

"" neocomplete
" 入力補完
NeoBundle 'Shougo/neocomplete.vim'

"" gundo.vim
" 高機能なundo
NeoBundleLazy 'sjl/gundo.vim', {
    \ 'autoload': {
    \   'commands': ['GundoToggle'],
    \}}

"" lightline.vim
NeoBundle 'itchyny/lightline.vim' 

"" vimfiler
NeoBundle 'Shougo/vimfiler'

"" indentLine
NeoBundle 'Yggdroot/indentLine'


"" colors
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

"" syntax
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'othree/javascript-syntax.vim'
"NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'

"" indent
NeoBundle 'othree/html5.vim'

"" No Repository
NeoBundleLocal ~/dotfiles/.vim/bundle/user
"NeoBundle 'css-vim', {'type' : 'nosync', 'base' : '~/dotfiles/.vim/bundle/user'}
"NeoBundle 'jquery-vim', {'type' : 'nosync', 'base' : '~/dotfiles/.vim/bundle/user'}
"NeoBundle 'xhtml-vim', {'type' : 'nosync', 'base' : '~/dotfiles/.vim/bundle/user'}


"----------------------------------------------------------
" 基本
"----------------------------------------------------------

" キーマップリーダーを変更
let mapleader = ","

" 編集中でもファイルを開けるように
set hidden

" 他で編集したファイルを自動で再読み込み
set autoread

" スクロール時の余白行数
set scrolloff=5

" バックアップを作成しない
set nobackup

" テンポラリディレクトリパス
set directory=~/dotfiles/.vim/tmp

" バックスペースでなんでも消せるように
set backspace=indent,eol,start

" テキスト整形オプション マルチバイト系を追加
set formatoptions=lmoq

" ビープ無効
set vb t_vb=

" 現在のディレクトリから開始
set browsedir=buffer

" カーソルを行をまたいで移動
"set whichwrap=b,s,h,l,<,>,[,]

" コマンドをステータスに表示
set showcmd

" 現在のモードを表示
set showmode

" viminfoの設定
set viminfo='50,<1000,s100,\"50

" モードラインを無効
set modelines=0

" タイトルを変更させない
set notitle

" ヤンクでクリップボードを使用
set clipboard=unnamed

" コマンドモードで補完を使用
set wildmode=longest:full,full


"----------------------------------------------------------
" 表示
"----------------------------------------------------------

" 折り返さない
set nowrap

" ルーラーを表示
set ruler

" 不可視文字を表示
set list

" 不可視文字の設定
" winだとユニコード文字でエラー出るっぽいので回避
if has('win32')
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,eol:\ 
else
    set listchars=tab:▸\ ,trail:-,extends:»,precedes:«,nbsp:%
endif

" 開始時の挨拶を表示しない
set shortmess+=I

" カレント行のハイライト
set cursorline

" 対応する括弧をハイライト表示する
set showmatch

" 括弧のハイライト表示の秒数を設定
set matchtime=3

" 行番号を表示
set number

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" 全角記号を1バイトとして扱う
set ambiwidth=single


"----------------------------------------------------------
" インデント
"----------------------------------------------------------

" tabの幅
set tabstop=4

" tabをスペースにする
set expandtab

" スマートインデント
set smartindent

" オートインデント
set autoindent

" キーボードから入力した場合のtabの幅
set softtabstop=4

" 自動で挿入/削除されるインデントの量
set shiftwidth=4

" paste時にコメントのインデントをやめる
autocmd Filetype * set formatoptions-=ro

" 折りたたむ
set foldmethod=manual

" PHPでcase/defaultをインデントする
let g:PHP_vintage_case_default_indent = 1


"----------------------------------------------------------
" 検索
"----------------------------------------------------------

" 末尾まで検索後、ファイル先頭にループさせる
set wrapscan

" 検索で大文字小文字を区別しない
set ignorecase

" 検索文字に大文字があるときは大文字小文字を区別する
set smartcase

" インクリメンタルサーチ
set incsearch

" 検索文字列をハイライト表示
set hlsearch

" 自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


"----------------------------------------------------------
" エンコーディング
"----------------------------------------------------------

" 文字コード関係
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix


"----------------------------------------------------------
" キーマップ
"----------------------------------------------------------

" 検索時にヒットした行を画面中央に表示
nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

"" コマンドラインモード
" 行頭に移動
cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>

" TABをスペースに変換
nnoremap <Leader>dt :<C-u>%s/\t/    /g<CR><ESC>
" CRを削除
nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//g<CR><ESC>


"----------------------------------------------------------
" プラグイン Plugin
"----------------------------------------------------------

"" vim-instant-markdown
if has('mac')
    "let g:instant_markdown_slow = 1
endif

"" vim-gitgutter
" windowsで動かないっぽい？
if has('mac')
    nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
    nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
endif

"" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" gundo.vim
nnoremap <Leader>ud :GundoToggle<CR>

" lightline.vim
" winのdark設定が反映しないので決め打ち
if has('win32')
    let g:lightline = {
        \ 'colorscheme': 'solarized_dark',
        \ 'component': {
        \   'readonly': '%{&readonly?"⭤":""}',
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
else
    let g:lightline = {
        \ 'colorscheme': 'solarized',
        \ 'component': {
        \   'readonly': '%{&readonly?"⭤":""}',
        \ },
        \ 'separator': { 'left': '⮀', 'right': '⮂' },
        \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
        \ }
endif

" indentline
let g:indentLine_char = '┊'


" プラグイン インデントをon
filetype plugin indent on


"----------------------------------------------------------
" カラー
"----------------------------------------------------------

" シンタックスハイライトを使用
syntax enable

" ターミナルタイプによるカラー設定
if &term =~ "xterm-256color" || "screen-256color"
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ "xterm-color"
    set t_Co=8
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" カラースキーム
set background=dark
"let scheme = 'solarized'
"augroup guicolorscheme
"    autocmd!
"    execute 'autocmd GUIEnter * colorscheme' scheme
"augroup END
"execute 'colorscheme' scheme
colorscheme solarized
let g:solarized_italic=0
highlight SpecialKey term=none gui=none cterm=none
autocmd Colorscheme * highlight SpecialKey term=none gui=none



"----------------------------------------------------------
" その他
"----------------------------------------------------------

" lua
if has('mac')
    let $LUA_DLL='/usr/local/lib/liblua.dylib'
endif

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" .vimrcや.gvimrcの変更を反映するためのKey-mappingを定義する
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

".vimrcや.gvimrcを変更すると、自動的に変更が反映されるようにする
" Set augroup.
augroup MyAutoCmd
    autocmd!
augroup END

if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif

