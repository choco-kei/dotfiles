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
require('rc/command')
-- require('rc/autocmd')

-- Configuration
--vim.api.nvim_exec([[
--    for f in split(glob('~/.config/nvim/rc/plugins/*.vim'), '\n')
--      execute 'source ' . f
--    endfor
--    ]], true
--)
--for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/rc/plugins', [[v:val =~ '\.lua$']])) do
--    require('rc/plugins/' .. file:gsub('%.lua$', ''))
--end

-- VSCode
--if vim.g.vscode then
--    require('rc/vscode-neovim/mappings')
--end

-- ローカル設定
if vim.fn.filereadable(vim.fn.expand('~/.nvim.local.lua')) ~= 0 then
    dofile(vim.fn.expand('~/.nvim.local.lua'))
end
