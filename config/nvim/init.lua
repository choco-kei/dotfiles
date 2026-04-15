vim.loader.enable()

vim.o.langmenu = os.getenv('LANG') or 'ja_JP.UTF-8'
vim.o.fileencodings = 'utf-8,cp932,euc-jp,iso-20220-jp,default,latin,sjis'
vim.o.fileformats = 'unix,dos,mac'

require('rc.options')
require('rc.displays')
require('rc.keymaps')

require('rc.pluginlist')
--require('rc/pluginlist_minimal')

require('rc.command')
require('rc.autocmd')

local function load_config(path)
  local expanded_path = vim.fn.expand(path)
  if vim.uv.fs_stat(expanded_path) then
    dofile(expanded_path)
  end
end

-- ローカル設定
load_config('~/.nvim.local.lua')

-- プロジェクト設定
load_config('.nvim.project.lua')
