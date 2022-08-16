-- nvim color
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

vim.o.synmaxcol = 200
-- ColorScheme
vim.cmd([[ syntax enable ]]) -- シンタックスカラーリングオン
vim.o.t_Co = 256
vim.o.background = 'dark'

-- true color support
vim.g.colorterm = os.getenv('COLORTERM')
if
    vim.g.colorterm == 'truecolor'
    or vim.g.colorterm == '24bit'
    or vim.g.colorterm == 'rxvt'
    or vim.g.colorterm == ''
then
    if vim.fn.exists('+termguicolors') then
        vim.o.t_8f = '<Esc>[38;2;%lu;%lu;%lum'
        vim.o.t_8b = '<Esc>[48;2;%lu;%lu;%lum'
        vim.o.termguicolors = true
    end
end

-- 表示
vim.o.modelines = false -- モードラインを無効
vim.o.wrap = false -- 折り返さない
vim.o.ruler = true -- ルーラーを表示
vim.o.cursorline = false -- カレント行のハイライト
vim.o.showmatch = true -- 対応する括弧をハイライト表示する
vim.o.matchtime = 3 -- 括弧のハイライト表示の秒数を設定
vim.o.number = true-- 行番号を表示
vim.o.relativenumber = true -- 行番号を相対値で表示

-- 折りたたみ
-- treesitter側で設定
--vim.o.foldmethod = 'marker'
--vim.o.foldlevel = 1
--vim.o.foldmethod = 'expr'
--vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
--vim.o.foldlevel = 20 

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
