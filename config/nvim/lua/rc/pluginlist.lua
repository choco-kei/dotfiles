local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- 非同期で git clone を実行
    vim.loop.spawn("git", {
        args = {
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        },
        stdout = vim.loop.new_pipe(false),
        stderr = vim.loop.new_pipe(false),
        cwd = vim.fn.stdpath("data"),
        detached = true,
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

local options = {
    defaults = {
        lazy = true,
    },
}

require("lazy").setup(plugins, options)
