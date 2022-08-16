vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

vim.o.shada = "'50,<1000,s100,\"1000,!"
vim.o.shadafile = vim.fn.stdpath('data') .. '/shada/main.shada'
vim.o.shellslash = true
vim.o.completeopt = 'menuone,noselect,noinsert'

-- タブ
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = "tab:▹ ,trail:-,extends:»,precedes:«,eol: ,nbsp:%"

-- 入力
vim.o.backspace = 'indent,eol,start' -- バックスペースでなんでも消せるように
vim.o.clipboard = 'unnamedplus,unnamed,' .. vim.o.clipboard -- ヤンクでクリップボードを使用
vim.o.formatoptions = 'lmq' -- テキスト整形オプション
vim.api.nvim_create_autocmd({'BufEnter'}, {
    pattern = {'*.php'},
    command = 'set formatoptions-=ro',
})
--autocmd Filetype * setlocal formatoptions-=ro

-- ファイル
vim.o.hidden = true -- 編集中でもファイルを開けるように
vim.o.autoread = true -- 他で編集したファイルを自動で再読み込み
vim.o.backup = false -- バックアップを作成しない
vim.o.swapfile = false -- スワップファイルを作成しない
vim.o.hidden = true -- 編集中でもファイルを開けるように
vim.o.autoread = true -- 他で編集したファイルを自動で再読み込み
vim.o.browsedir = 'buffer' -- 現在のディレクトリから開始
vim.o.undofile = true -- undofile

-- 操作
vim.o.scrolloff = 5 -- スクロール時の余白行数
vim.o.sidescrolloff = 6 -- スクロール時の余白行数

-- 検索
vim.o.wrapscan = true -- 末尾まで検索後、ファイル先頭にループさせる
vim.o.ignorecase = true -- 検索で大文字小文字を区別しない
vim.o.smartcase = true -- 検索文字に大文字があるときは大文字小文字を区別する
vim.o.incsearch = true -- インクリメンタルサーチ
vim.o.hlsearch = true -- 検索文字列をハイライト表示

-- コマンド
vim.o.lazyredraw = true -- コマンド実行中は再描画しない
vim.o.showcmd = true-- コマンドをステータスに表示
vim.o.showmode = true -- 現在のモードを非表示
vim.o.wildmode = 'longest:full,full' -- コマンドモードで補完を使用
vim.o.wildmenu = true -- コマンドモードで補完を使用
vim.o.wildignorecase = true -- 補完で大文字小文字を無視

-- タグ
vim.o.tags = 'tags,./.tags' .. vim.o.tags -- タグファイルを指定
vim.o.showfulltag = true -- 補完時に1行まるごと補完
vim.o.wildoptions = 'tagfile' -- タグから補完リストに追加

-- 他
vim.o.title = false -- タイトルを変更させない
vim.o.errorbells = false -- ビープ無効
vim.o.visualbell = false -- ビープ無効
vim.o.ttyfast = true -- 高速ターミナル接続を行う
