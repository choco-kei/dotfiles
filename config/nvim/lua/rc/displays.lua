-- nvim color
vim.o.termguicolors = true

vim.o.synmaxcol = 300
-- ColorScheme
vim.cmd([[ syntax enable ]]) -- シンタックスカラーリングオン
--vim.o.t_Co = 256
vim.o.background = 'dark'

-- 表示
--vim.o.modelines = false -- モードラインを無効
vim.o.wrap = false -- 折り返さない
vim.o.ruler = true -- ルーラーを表示
vim.o.cursorline = false -- カレント行のハイライト（autocmdで制御）
vim.o.showmatch = true -- 対応する括弧をハイライト表示する
vim.o.matchtime = 3 -- 括弧のハイライト表示の秒数を設定
vim.o.number = true-- 行番号を表示
vim.o.relativenumber = true -- 行番号を相対値で表示

-- アクティブウィンドウでのみ cursorline を表示
vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
vim.api.nvim_create_autocmd("WinEnter", {
    group = "CursorLineControl",
    callback = function()
        vim.wo.cursorline = true
    end,
})
vim.api.nvim_create_autocmd("WinLeave", {
    group = "CursorLineControl",
    callback = function()
        vim.wo.cursorline = false
    end,
})

-- 折りたたみ
-- navigator側で設定
--vim.o.foldmethod = 'marker'
--vim.o.foldlevel = 1
--vim.o.foldmethod = 'expr'
--vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.o.foldlevel = 2

-- ステータスライン
--vim.o.laststatus = 2
vim.o.laststatus = 3
vim.o.shortmess = 'I' .. vim.o.shortmess -- 開始時の挨拶を表示しない
vim.o.shortmess = 's' .. vim.o.shortmess -- 検索ループ時のメッセージを表示しない
vim.opt.fillchars = {
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┫',
    vertright = '┣',
    verthoriz = '╋',
}

-- Diagnostic アイコン設定
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌶",
    },
  },
})


-- 実験的UI (ui2) の有効化
if vim.version().minor >= 12 then
  require('vim._core.ui2').enable({})
end
