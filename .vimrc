"----------------------------------------------------------
" .vimrc
"----------------------------------------------------------

" 基本設定
source ~/dotfiles/.vimrc.base

" 表示設定
source ~/dotfiles/.vimrc.apperance

" インデント設定
source ~/dotfiles/.vimrc.indent

" 検索設定
source ~/dotfiles/.vimrc.search

" エンコーディング設定
source ~/dotfiles/.vimrc.encoding

" その他設定
source ~/dotfiles/.vimrc.misc

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


" カラー設定
source ~/dotfiles/.vimrc.color

