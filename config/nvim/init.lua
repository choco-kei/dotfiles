vim.loader.enable()

vim.o.langmenu = os.getenv("LANG") or "ja_JP.UTF-8"
vim.o.fileencodings = "utf-8,cp932,euc-jp,iso-2022-jp,default,latin"
vim.o.fileformats = "unix,dos,mac"
vim.o.exrc = true

require("rc.options")
require("rc.displays")
require("rc.keymaps")

require("rc.pluginlist")

require("rc.command")
require("rc.autocmd")

local function load_config(path)
  local expanded_path = vim.fn.expand(path)
  if vim.uv.fs_stat(expanded_path) then
    local status, err = pcall(dofile, expanded_path)
    if not status then
      vim.notify("Failed to load: " .. path .. "\n" .. err, vim.log.levels.ERROR)
    end
  end
end

-- ローカル設定
load_config("~/.nvim.local.lua")
