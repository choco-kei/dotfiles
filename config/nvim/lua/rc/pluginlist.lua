local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

COLOR_SCHEME = "nightfox.nvim"

local plugins = {
    spec = {
        { import = "rc.plugins" },
        { import = "rc.plugins.completion" },
        { import = "rc.plugins.debugger" },
        { import = "rc.plugins.edit" },
        { import = "rc.plugins.filetype" },
        { import = "rc.plugins.lsp" },
        { import = "rc.plugins.search" },
        { import = "rc.plugins.snippet" },
        { import = "rc.plugins.telescope" },
        { import = "rc.plugins.terminal" },
        { import = "rc.plugins.treesitter" },
        { import = "rc.plugins.ui" },
    },
}

require("lazy").setup(plugins)
