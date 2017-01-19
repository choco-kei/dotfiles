"----------------------------------------------------------
" encoding {{{
"----------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8

"}}}

"----------------------------------------------------------
" プラグイン読み込み {{{
"----------------------------------------------------------

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/auto/neobundle.vim/
    call neobundle#begin(expand('~/dotfiles/.vim/bundle/auto/'))
endif

"" NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"" unite.vim
NeoBundle 'Shougo/unite.vim'

"" neomru
NeoBundle 'Shougo/neomru.vim'

"" unite-outline
NeoBundle 'Shougo/unite-outline'

"" unite-tag
NeoBundle 'tsukkee/unite-tag'

"" unite-colorscheme
NeoBundle 'ujihisa/unite-colorscheme'

"" unite-quickfix
NeoBundle 'osyo-manga/unite-quickfix'

"" unite-qfixhowm
NeoBundle 'osyo-manga/unite-qfixhowm'

"" unite-matchers
"NeoBundle 'basyura/unite-matchers'

"" codic-vim
NeoBundle 'koron/codic-vim'

"" unite-codic
NeoBundle 'rhysd/unite-codic.vim'

"" vim-qfreplace
NeoBundle 'thinca/vim-qfreplace'

"" vimproc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }

"" itermcolors-vim
" vim syntaxからiTermのカラー設定を作成
NeoBundle 'akiomik/itermcolors-vim'

"" vim-gitgutter
" windowsで動かないっぽい？
if has('mac')
  " macvimで表示がおかしいのでとりあえずコメントアウト
  NeoBundle 'airblade/vim-gitgutter'
endif

"" vim-fugitive
NeoBundle 'tpope/vim-fugitive'

"" neocomplete
NeoBundle 'Shougo/neocomplete.vim'

"" neoinclude
NeoBundle 'Shougo/neoinclude.vim'

"" neco-syntax
NeoBundle 'Shougo/neco-syntax'

"" neco-vim
NeoBundle 'Shougo/neco-vim'

"" neosnippet
NeoBundle 'Shougo/neosnippet'

"" gundo.vim
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'autoload': {
      \   'commands': ['GundoToggle'],
      \ }}

"" lightline.vim
NeoBundle 'itchyny/lightline.vim'

"" vimfiler
NeoBundle 'Shougo/vimfiler'

"" indentLine
NeoBundle 'Yggdroot/indentLine'

"" foldCC
NeoBundle 'LeafCage/foldCC'

"" vim-over
NeoBundle 'osyo-manga/vim-over'

"" yankround.vim
NeoBundle 'LeafCage/yankround.vim'

"" vim-quickhl
NeoBundle 't9md/vim-quickhl'

"" vim-anzu
NeoBundle 'osyo-manga/vim-anzu'

"" syntastic
NeoBundle 'scrooloose/syntastic'

"" vim-operator-user
NeoBundle 'kana/vim-operator-user'
"" vim-operator-replace
NeoBundle 'kana/vim-operator-replace'
"" vim-operator-search
NeoBundle 'osyo-manga/vim-operator-search'

"" vim-textobj-user
NeoBundle 'kana/vim-textobj-user'

" 関数内
" af, if
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'kentaro/vim-textobj-function-php'

" カーソル行
" al, il
NeoBundle 'kana/vim-textobj-line'

" 日付と時刻
" ada, ida
NeoBundle 'kana/vim-textobj-datetime'

" コメント
" ac, ic
NeoBundle 'thinca/vim-textobj-comment'

" ASCII文字とマルチバイト文字の境界を区切り
" am, im
"NeoBundle 'deton/textobj-mbboundary.vim'

" URL
" au, iu
NeoBundle 'mattn/vim-textobj-url'

" 任意の複数の括弧のいずれか
" asb, isb
NeoBundle 'osyo-manga/vim-textobj-multiblock'

" インデントの空白行
" ao, io
NeoBundle 'glts/vim-textobj-indblock'

"" QFixHowm
NeoBundle 'fuenor/qfixhowm'

"" mtachit
NeoBundle 'tmhedberg/matchit'

"" vim-easymotion
NeoBundle 'Lokaltog/vim-easymotion'

"" vim-repeat
NeoBundle 'tpope/vim-repeat'

"" auto-ctags.vim
"NeoBundle 'soramugi/auto-ctags.vim'

"" elzr/vim-json
NeoBundle 'elzr/vim-json'

"" vim-php-cs-fixer
NeoBundle 'stephpy/vim-php-cs-fixer'

"" junegunn/vim-easy-align
NeoBundle 'junegunn/vim-easy-align'

"" vdebug
NeoBundle 'joonty/vdebug'

"" DBGPavim
"NeoBundle 'choco-kei/DBGPavim'



"" colors
NeoBundle 'tomasr/molokai'
"NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'illicium/vim-colors-solarized', {
      \ 'rev': 'cb5b184d05dece1b7ed74ad2313f009bb18f63fc'
      \}
NeoBundle 'sjl/badwolf'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'morhetz/gruvbox'
NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'hamxiaoz/sonofobsidian_hamxiaoz'
NeoBundle 'vyshane/vydark-vim-color'
NeoBundle 'chriskempson/tomorrow-theme'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'twerth/ir_black'
NeoBundle 'vim-scripts/moria'
NeoBundle 'fmoralesc/vim-vitamins'
NeoBundle 'vim-scripts/tango.vim'
NeoBundle 'vim-scripts/vylight'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'larssmit/vim-getafe'

"" syntax
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'othree/javascript-syntax.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'tpope/vim-markdown'
"NeoBundle 'StanAngeloff/php.vim'
NeoBundle 'paulyg/Vim-PHP-Stuff'
NeoBundle 'jwalton512/vim-blade'

"" indent
NeoBundle 'othree/html5.vim'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle '2072/PHP-Indenting-for-VIm'

"" No Repository
NeoBundleLocal expand('~/dotfiles/.vim/bundle/user');
NeoBundle 'neocomplete-php-analyze.vim', {
      \   'type' : 'nosync',
      \   'base' : '~/dotfiles/.vim/bundle/user'
      \ }

call neobundle#end()

"}}}

"----------------------------------------------------------
" 基本 {{{
"----------------------------------------------------------

" キーマップリーダーを変更
let mapleader = ','

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

" runtimepathの追加
set runtimepath+=~/dotfiles/.vim/
set runtimepath+=~/dotfiles/.vim/after/

" バックスペースでなんでも消せるように
set backspace=indent,eol,start

" テキスト整形オプション
set formatoptions=lmq
autocmd Filetype * setlocal formatoptions-=ro

" ビープ無効
set visualbell t_vb=

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

" スワップファイルを作らない
set noswapfile

" undofile
set undodir=~/dotfiles/.vim/undo


"}}}

"----------------------------------------------------------
" 表示 {{{
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
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,eol:\ ,nbsp:%
else
    set listchars=tab:▹\ ,trail:-,extends:»,precedes:«,eol:\ ,nbsp:%
endif

" 開始時の挨拶を表示しない
set shortmess+=I

" 検索ループ時のメッセージを表示しない
set shortmess+=s

" カレント行のハイライト
set cursorline

" 対応する括弧をハイライト表示する
set showmatch

" 括弧のハイライト表示の秒数を設定
set matchtime=3

" 行番号を表示
set number

" 行番号を絶対値で表示
set relativenumber

" コマンド実行中は再描画しない
set lazyredraw

" 高速ターミナル接続を行う
set ttyfast

" 全角記号を1バイトとして扱う
set ambiwidth=single

" IMオン時にカーソルの色を変える
"if has('multi_byte_ime') || has('xim')
"  highlight Cursor guifg=NONE guibg=White
"  highlight CursorIM guifg=NONE guibg=DarkRed
"endif


"}}}

"----------------------------------------------------------
" インデント {{{
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

" 折りたたみ
set foldmethod=marker
set foldlevel=1
set foldcolumn=0


" }}}

"----------------------------------------------------------
" 検索 {{{
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

" grep
if has('win32')
    set grepprg=jvgrep
endif

" }}}


"----------------------------------------------------------
" タグ {{{
"----------------------------------------------------------
" タグファイルを指定
set tags+=.tags,./.tags

" 補完時に1行まるごと補完
set showfulltag

" タグから補完リストに追加
set wildoptions=tagfile


" }}}

"----------------------------------------------------------
" エンコーディング {{{
"----------------------------------------------------------

" 文字コード関係
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis
set fileformats=unix

" }}}

"----------------------------------------------------------
" キーマップ {{{
"----------------------------------------------------------
"
" 検索時にヒットした行を画面中央に表示 折りたたみを展開
nmap n <Plug>(anzu-n)zzzv
nmap N <Plug>(anzu-N)zzzv
" */#をsmartcaseに対応できるように置き換え
nmap * /<C-r><C-w><CR>N
nmap # ?<C-r><C-w><CR>N

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
nmap <Tab> %
vmap <Tab> %

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
nnoremap <Leader>dt :<C-u>retab<CR>
" CRを削除
"nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//g<CR>
" TAB CR削除
nnoremap <Leader>dc :<C-u>%s/<C-v><C-m>//ge<CR>:noh<CR>:retab<CR>gg

"" タブ操作
" tl 次のタブ
map <silent> [Tag]l :tabnext<CR>
" th 前のタブ
map <silent> [Tag]h :tabprevious<CR>


"" unite.vim
nnoremap [unite] <Nop>
nmap <Leader>u [unite]
" buffer
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" file
"nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" file_rec
"nnoremap <silent> [unite]fr :<C-u>Unite file_rec<CR>
" file_rec/async
nnoremap <silent> [unite]f :<C-u>Unite file_rec/async -buffer-name=file-async<CR>
nnoremap <silent> [unite]vf :<C-u>UniteResume file-async<CR>
" register
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" neomru
" プロジェクトごとに出し分ける
call unite#custom#source(
      \ 'file_mru', 'matchers',
      \ ['matcher_project_files', 'matcher_default', 'matcher_hide_hidden_files'])

" 表示変更
"call unite#custom#source(
"      \ 'file_mru', 'matchers',
"      \ ['matcher_file_name', 'sorter_default', 'converter_file_directory'])

" file_rec
let g:unite_source_rec_max_cache_files = 20000
let g:unite_source_rec_async_command = [
      \ 'ag', '--follow', '--nocolor', '--nogroup', '--hidden',
      \ '--ignore-dir', 'framework',
      \ '--ignore-dir', 'translate',
      \ '-g', '']

" Unite file_mru
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" vimが落ちるとmruが保存されないのでその対策
"nnoremap <silent> [unite]m :<C-u>call g:Savemru()<CR>
"function! g:Savemru()
"  Unite file_mru
"  call neomru#_save()
"endfunction
nnoremap <silent> [unite]d :<C-u>Unite directory_mru<CR>
" yankround
nnoremap <silent> [unite]y :<C-u>Unite yankround<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語からgrep
nnoremap <silent> [unite]cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
" grep検索結果を再呼び出し
nnoremap <silent> [unite]vg :<C-u>UniteResume search-buffer<CR>
" unite-tag
let g:unite_source_tag_max_name_length = 30
let g:unite_source_tag_max_fname_length = 40
nnoremap <silent> [unite]t :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>

" unite-tag wordにファイルパスを追加
let s:filters = {
      \   "name" : "converter_add_filepath_word",
      \}
function! s:filters.filter(candidates, context)
  let candidates = copy(a:candidates)
  let max = 0
  for candidate in candidates
    let abbr = split(candidate.abbr, '')
    let candidate.word = candidate.word . abbr[1]
  endfor
  return candidates
endfunction
call unite#define_filter(s:filters)
unlet s:filters
call unite#custom#source('tag', 'matchers', ["converter_add_filepath_word", "matcher_default"])

function! s:UniteMapping()
  " C-gで閉じる
  imap <buffer><C-g> <Plug>(unite_exit)
  " マークを変更
  nmap <silent> <buffer> J <Plug>(unite_toggle_mark_current_candidate)
  nmap <silent> <buffer> K <Plug>(unite_toggle_mark_current_candidate_up)
endfunction

function! s:VimFilerMapping()
  " マークを変更
  nmap <buffer> J <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer> K <Plug>(vimfiler_toggle_mark_current_line_up)
  nmap <buffer> vv <Plug>(vimfiler_toggle_mark_all_lines)
  nmap <buffer> vu <Plug>(vimfiler_clear_mark_all_lines)
endfunction

augroup mapping
  autocmd!
  autocmd FileType unite call s:UniteMapping()
  autocmd FileType vimfiler call s:VimFilerMapping()
augroup END


"
"nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
"nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" tags
" t: tags-and-searches
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Jump.
" nnoremap [Tag]t  <C-]>
nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "\<C-]>" :
            \ ":\<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include\<CR>"
nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
            \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"

" Tab jump
for n in range(1, 9)
    execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

"}}}

"----------------------------------------------------------
" プラグイン {{{
"----------------------------------------------------------

"" unite.vim
" ディレクトリ変更
let g:unite_data_directory=expand('~/dotfiles/.vim/tmp/unite')
" 起動時にインサートモードで開始
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
let g:unite_source_grep_encoding = 'utf-8'
"時間のフォーマット
let g:unite_source_buffer_time_format = '(%Y.%m.%d %H:%M:%S) '

" history/yankの有効化
let g:unite_source_history_yank_enable = 1

" grep commands
"if executable('hw')
"  let g:unite_source_grep_command = 'hw'
"  let g:unite_source_grep_default_opts = '--no-group --no-color'
"  let g:unite_source_grep_recursive_opt = ''
if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-S --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
"elseif executable('pt')
"  " Use pt in unite grep source.
"  " https://github.com/monochromegane/the_platinum_searcher
"  let g:unite_source_grep_command = 'pt'
"  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
"  let g:unite_source_grep_recursive_opt = ''
"elseif executable('ack-grep')
"  " Use ack in unite grep source.
"  let g:unite_source_grep_command = 'ack-grep'
"  let g:unite_source_grep_default_opts =
"        \ '-i --no-heading --no-color -k -H'
"  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts =
        \ '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

" unite-grep
let g:unite_source_grep_max_candidates = 10000

"" neomru
let g:neomru#file_mru_path      = expand('~/dotfiles/.vim/tmp/neomru/file')
let g:neomru#directory_mru_path = expand('~/dotfiles/.vim/tmp/neomru/directory')
let g:neomru#time_format        = '(%Y.%m.%d %H:%M:%S) '
let g:neomru#filename_format    = ':~:.'
let g:neomru#file_mru_limit     = 2000
"let g:neomru#update_interval    = 300

"" unite-quickfix
let g:unite_quickfix_is_multiline = 1
let g:unite_quickfix_filename_is_pathshorten = 0

"" vimfiler
" ディレクトリ変更
let g:vimfiler_data_directory=expand('~/dotfiles/.vim/tmp/vimfiler')

"" vim-gitgutter
" windowsで動かないっぽい？
if has('mac')
    let g:gitgutter_sign_added = '+'
    let g:gitgutter_sign_modified = '⇒'
    let g:gitgutter_sign_removed = '-'
    nnoremap <silent> <Leader>gg :<C-u>GitGutterToggle<CR>
    nnoremap <silent> <Leader>gh :<C-u>GitGutterLineHighlightsToggle<CR>
endif

"" neocomplete
" ディレクトリ変更
let g:neocomplete#data_directory=expand('~/dotfiles/.vim/tmp/neocomplete')
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Max list
let g:neocomplete#max_list = 20
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:necosyntax#min_keyword_length = 3
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
" Delimiter
if !exists('g:neocomplete#delimiter_patterns')
  let g:neocomplete#delimiter_patterns = {}
endif
" PHP -> :: \
let g:neocomplete#delimiter_patterns.php = ['->', '::', '\']
" Ruby . ::
let g:neocomplete#delimiter_patterns.ruby = ['.', '::']

" Enable omni completion.
augroup neocompleteOmni
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  "autocmd FileType php setlocal omnifunc=phpomplete#CompletePHP
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" Include
if !exists('g:neoinclude#paths')
    let g:neoinclude#paths = {}
endif
let g:neoinclude#patterns = {}
let g:neoinclude#exprs = {}
if !exists('g:neoinclude#functions')
    let g:neoinclude#functions = {}
endif
let g:neoinclude#functions.php = 'neocomplete_php_analyze#zend_include_files'

" Member
if !exists('g:neocomplete#sources#member#prefix_patterns')
    let g:neocomplete#sources#member#prefix_patterns = {}
endif
let g:neocomplete#sources#member#prefix_patterns.php = '->\|::'

" Ctags
let g:neoinclude#ctags_arguments = {
      \ 'php': '--regex-php="/^[ \t]*const[ \t]+([[:alnum:]_]+)/\1/d/"'
      \ }

" 補完を止める
"call neocomplete#custom#source('include',
"      \ 'disabled_filetypes', {'php' : 1})

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
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"

"" gundo.vim
"let g:gundo_prefer_python3 = 1
nnoremap <Leader>gd :GundoToggle<CR>

"" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonly', 'fugitive', 'gitgutter', 'filename', 'modified'],
      \     ['anzu']
      \   ],
      \   'right':[
      \     ['syntastic', 'lineinfo'],
      \     ['percent'],
      \     ['fileformat', 'fileencoding', 'filetype']
      \   ]
      \ },
      \ 'component_function': {
      \   'readonly': 'LlReadonly',
      \   'modified': 'LlModified',
      \   'fugitive': 'LlFugitive',
      \   'filename': 'LlFilename',
      \   'fileformat': 'LlFileformat',
      \   'filetype': 'LlFiletype',
      \   'fileencoding': 'LlFileencoding',
      \   'mode': 'LlMode',
      \   'anzu': 'anzu#search_status',
      \   'gitgutter': 'LlGitGutter'
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LlModified()
  return &filetype =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LlReadonly()
  return &filetype !~? 'help' && &readonly ? '⭤' : ''
endfunction

function! LlFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo' ? '' :
        \ &filetype == 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype == 'unite' ? unite#get_status_string() :
        \ &filetype == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LlFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo' && &filetype !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠'  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LlFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LlFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LlFileencoding()
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LlMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ &filetype == 'unite' ? 'Unite' :
        \ &filetype == 'vimfiler' ? 'VimFiler' :
        \ &filetype == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LlGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost,BufReadPost *.php,*.js,*.css,*.html call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

" 他プラグインのステータスライン上書き
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"" indentline
let g:indentLine_char = '┊'
let g:indentLine_bufNameExclude = ['\[unite\].*', 'vimfiler.*']
let g:indentLine_faster = 1

"" fonldCC
set foldtext=FoldCCtext()
let g:foldCCtext_maxchars = 120
let g:foldCCtext_head = '"( ˘ω˘) "'
let g:foldCCtext_tail = '" ".(v:foldend-v:foldstart+1)." (˘ω˘ )"'

"" neosnippet
let g:neosnippet#disable_runtime_snippets = {
      \ '_': 1,
      \ }
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>"
      \: neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
      \"\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
"let g:neosnippet#enable_preview = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory=expand('~/dotfiles/.vim/snippets')

"" vim-over
nnoremap [vim-over] <Nop>
nmap <Leader>m [vim-over]
" over.vimの起動
nnoremap <silent> [vim-over]s :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap <silent> [vim-over]c :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
"nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"" yankround.vim
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-next)
nmap <C-n> <Plug>(yankround-prev)
let g:yankround_dir = expand('~/dotfiles/.vim/tmp/yankround/')
let g:yankround_max_history = 50

"" vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)

"" vim-anzu
let g:anzu_bottomtop_word = '( ˘ω˘)ｳｪ'
let g:anzu_topbottom_word = '( ˘ω˘)ｼﾀ'
let g:anzu_status_format = '%p[%i/%l] %w'
set statusline=%{anzu#search_status()}
augroup vim-anzu
  " 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
  " 検索ヒット数の表示を消去する
  autocmd!
  autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END

"" vim-operator-replace
map R <Plug>(operator-replace)

"" vim-textobj-user
omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"" vim-operator-search
nmap <Space>s <Plug>(operator-search)
nmap <Space>/ <Plug>(operator-search)if

"" syntastic
"nmap <Leader>sc :SyntasticCheck<CR>
" とりあえずactive
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': []
      \ }
" ファイルオープン時にチェック
let g:syntastic_check_on_open = 1
" マウスオーバーでポップアップ
let g:syntastic_enable_balloons = 0
" エラー時に自動でQuickfix
let g:syntastic_auto_loc_list = 0
" phpcsの構文チェックをPSR2に変更
let g:syntastic_php_phpcs_args = '--report=csv --standard=PSR2'
" location_listをunite-quickfixで表示
let g:syntastic_always_populate_loc_list = 1
" ステータスライン表示を変更
let g:syntastic_stl_format = '%E{[Syntax: line:%F (%e)]}'
let g:syntastic_enable_highlighting = 0
" シンボルを変更
let g:syntastic_error_symbol         = '▸'
let g:syntastic_warning_symbol       = '▹'
let g:syntastic_style_error_symbol   = '▸'
let g:syntastic_style_warning_symbol = '▹'

"" QFixHowm
let QFixHowm_Key = 'g'
let howm_dir          = '~/memo'
let howm_filename     = '%Y/%m/%Y-%m-%d-%H%M%S.md'
let howm_fileencoding = 'utf-8'
let howm_fileformat   = 'unix'
let QFixHowm_FileType = 'markdown'
let QFixHowm_Title    = '#'
let QFixHowm_SaveTime = -1
let QFixHowm_Template = [
      \ "%TITLE% ",
      \ ""
      \ ]

"" vim-easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 0
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_migemo = 0
" find motion
map f <Plug>(easymotion-bd-fl)
map F <Plug>(easymotion-bd-tl)
" 2-keys find motion
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"" elzr/vim-json
let g:vim_json_syntax_conceal = 0

"" vim-php-cs-fixer
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_config = 'default'
let g:php_cs_fixer_php_path = 'php'
let g:php_cs_fixer_fixers_list = '-psr0'
let g:php_cs_fixer_enable_default_mapping = 1
let g:php_cs_fixer_dry_run = 0
let g:php_cs_fixer_verbose = 0

"" StanAngeloff/php.vim
"function! PhpSyntaxOverride()
"  hi! def link phpDocTags  phpDefine
"  hi! def link phpDocParam phpType
"endfunction
"
"augroup phpSyntaxOverride
"  autocmd!
"  autocmd FileType php call PhpSyntaxOverride()
"augroup END

"" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" vdebug
let g:vdebug_options= {
      \ 'port': 9001,
      \}

" プラグイン インデントをon
filetype plugin indent on

" }}}


"----------------------------------------------------------
" カラー {{{
"----------------------------------------------------------

" シンタックスハイライトを使用
syntax enable

" ターミナルタイプによるカラー設定
if &term =~ 'xterm-256color' || 'screen-256color'
    set t_Co=256
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ 'xterm-debian' || &term =~ 'xterm-xfree86'
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
elseif &term =~ 'xterm-color'
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

" }}}


"----------------------------------------------------------
" その他 {{{
"----------------------------------------------------------

" 現在のファイルパスをコピー
command! CopyPath
      \ let @*=expand('%') | echo 'copied'

" jsonを整形
command! JsonFormat :execute '%!python -m json.tool'
      \ | :execute '%!python -c "import re,sys;chr=__builtins__.__dict__.get(\"unichr\", chr);sys.stdout.write(re.sub(r\"\\\\u[0-9a-f]{4}\", lambda x: chr(int(\"0x\" + x.group(0)[2:], 16)).encode(\"utf-8\"), sys.stdin.read()))"'
      \ | :set ft=json
      \ | :1


" vimdiff
if &diff
  filetype off
  set diffopt+=iwhite
endif

set diffexpr=MyDiff()
function! MyDiff()
  let opt = ''
  if &diffopt =~ 'white'
    let opt = opt . '-b '
  endif
  silent execute '!git-diff-normal ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
  redraw!
endfunction

" 保存時に行末スペースを削除
augroup saveFile
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" .vimrcや.gvimrcの変更を反映するためのKey-mappingを定義する
" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

"".vimrcや.gvimrcを変更すると、自動的に変更が反映されるようにする
"" Set augroup.
"augroup MyAutoCmd
"    autocmd!
"augroup END
"
"if !has('gui_running') && !(has('win32') || has('win64'))
"    " .vimrcの再読込時にも色が変化するようにする
"    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
"else
"    " .vimrcの再読込時にも色が変化するようにする
"    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
"                \if has('gui_running') | source $MYGVIMRC
"    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
"endif

" ローカル設定
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}
