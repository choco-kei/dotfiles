if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" キーマップリーダーを最初に定義
let mapleader = ','

" True Color対応
if has('nvim')
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
    set termguicolors
  endif
elseif has('patch-7.4.1778')
  set guicolors
endif

if exists('g:nyaovim_version')
  let s:dein_cache_path = expand('~/.cache/nyaovim/dein')
elseif has('nvim')
  let s:dein_cache_path = expand('~/.cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.cache/vim/dein')
endif

let s:dein_dir = s:dein_cache_path
      \ .'/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_dir, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})
  call dein#load_toml('~/.config/nvim/deinft.toml')

  if exists('g:nyaovim_version')
    call dein#add('rhysd/nyaovim-popup-tooltip')
    call dein#add('rhysd/nyaovim-markdown-preview')
    call dein#add('rhysd/nyaovim-mini-browser')
  endif

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

runtime! ./options.rc.vim
runtime! ./keymap.rc.vim

" ローカル設定
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" プロジェクト設定
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction
