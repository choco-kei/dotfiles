" タブ表示
set showtabline=2

" カラム数
set columns=110

" 行数
set lines=34

" GUIツールバー非表示
set guioptions-=T

" GUIメニュー非表示
set guioptions-=m

" 選択範囲のコピー
set guioptions+=a

" ビジュアルベルを無効
set visualbell t_vb=

" ノーマルモード ESC2回でIMEをOFF
nnoremap <silent> <ESC> <ESC>:set iminsert=0<CR>


"" MacVim
if has('gui_macvim')
    " 透明度
    set transparency=4
    " IM制御
    "set imdisable
    " 入力モードでIMを自動ON
    "set iminsert
    " モード切替でIMを自動ON/OFF
    set noimdisableactivate
    " 行間
    set linespace=0 "SorceCodePro
    " フォント
    "set guifont=Menlo-Regular:h14
    "set guifont=Osaka-Mono:h15
    "set guifont=Consolas:h14
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    "set guifont=Osaka-Mono:h15
    set guifontwide=ヒラギノ丸ゴ\ ProN\ W4:h10

"" Win GVim
elseif has('win32')
    " フォント
    set guifont=Source\ Code\ Pro\ for\ Powerline:h10
    " カラースキームをダークテーマに
    set background=dark
endif

" 不可視文字のbold解除
highlight SpecialKey gui=none
