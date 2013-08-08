set nowrap
set tabstop=4
set expandtab
set smartindent
set autoindent
set ruler
set softtabstop=4
set shiftwidth=4
set wrapscan
"set list
set shortmess+=I
set cursorline
set showmatch
set directory=~/.vim/tmp
set visualbell t_vb=
set nobackup
set nu
syntax enable



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
    set runtimepath+=~/.vim/bundle/auto/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/auto/'))
endif

" NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" vim syntaxからiTermのカラー設定を作成
NeoBundle 'akiomik/itermcolors-vim'

" マークダウンリアルタイムプレビュー
NeoBundle 'suan/vim-instant-markdown'
"let g:instant_markdown_slow = 1

" gitの差分を表示
NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>


" colors
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

" syntax
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'othree/javascript-syntax.vim'
"NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'

" indent
NeoBundle 'othree/html5.vim'

" No Repository
NeoBundleLocal ~/.vim/bundle/user
"NeoBundle 'css-vim', {'type' : 'nosync', 'base' : '~/.vim/bundle/user'}
"NeoBundle 'jquery-vim', {'type' : 'nosync', 'base' : '~/.vim/bundle/user'}
"NeoBundle 'xhtml-vim', {'type' : 'nosync', 'base' : '~/.vim/bundle/user'}


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

