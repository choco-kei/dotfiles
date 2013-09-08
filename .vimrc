" 折り返さない
set nowrap
" tabの幅
set tabstop=4
" tabをスペースにする
set expandtab
" スマートインデント
set smartindent
" オートインデント
set autoindent
" ルーラーを表示
set ruler
" キーボードから入力した場合のtabの幅
set softtabstop=4
" 自動で挿入/削除されるインデントの量
set shiftwidth=4
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
" 不可視文字を表示
"set list
" 不可視文字の設定
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
" 開始時の挨拶を表示しない
set shortmess+=I
" カレント行のハイライト
set cursorline
" 対応する括弧をハイライト表示する
"set showmatch
" 括弧のハイライト表示の秒数を設定
set matchtime=1
" テンポラリディレクトリパス
set directory=~/dotfiles/.vim/tmp
" バックアップを作成しない
set nobackup
" 行番号を表示
set number
" 文字コード関係
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix,dos
" シンタックスハイライトを使用
syntax enable

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


"lua
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


" Plugin Manage
set nocompatible

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/auto/neobundle.vim
    call neobundle#rc(expand('~/dotfiles/.vim/bundle/auto/'))
endif

"" NeoBundle
NeoBundle 'Shougo/neobundle.vim'

"" unite.vim
NeoBundle 'Shougo/unite.vim'

"" vim-singleton
"NeoBundle 'thinca/vim-singleton'
"call singleton#enable()

"" vim syntaxからiTermのカラー設定を作成
NeoBundle 'akiomik/itermcolors-vim'

"" マークダウンリアルタイムプレビュー
if has('mac')
    NeoBundle 'suan/vim-instant-markdown'
    "let g:instant_markdown_slow = 1
endif

"" vitの差分を表示
" windowsで動かないっぽい？
if has('mac')
    NeoBundle 'airblade/vim-gitgutter'
    nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
    nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>
endif

"" 入力補完
NeoBundle 'Shougo/neocomplete.vim'
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


filetype plugin indent on
autocmd Filetype * set formatoptions-=ro

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
let scheme = 'solarized'
augroup guicolorscheme
    autocmd!
    execute 'autocmd GUIEnter * colorscheme' scheme
augroup END
execute 'colorscheme' scheme

