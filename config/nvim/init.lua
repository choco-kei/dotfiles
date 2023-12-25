vim.loader.enable()

vim.o.langmenu = os.getenv('LANG')

vim.o.encoding = 'utf-8'
vim.o.fileencodings = 'utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis'
vim.o.fileformats = 'unix,dos,mac'

-- lsp debug
--vim.lsp.set_log_level('debug')

require('rc/options')
require('rc/displays')
require('rc/keymaps')

require('rc/pluginlist')
--require('rc/pluginlist_minimal')

require('rc/command')
require('rc/autocmd')

-- ローカル設定
if vim.fn.filereadable(vim.fn.expand('~/.nvim.local.lua')) ~= 0 then
    dofile(vim.fn.expand('~/.nvim.local.lua'))
end

-- プロジェクト設定
if vim.fn.filereadable('.nvim.project.lua') ~= 0 then
    dofile('.nvim.project.lua')
end
