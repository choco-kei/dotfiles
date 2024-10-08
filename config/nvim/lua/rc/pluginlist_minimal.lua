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

local colorscheme = "nightfox.nvim"

require("lazy").setup({
    {
        "nathom/filetype.nvim",
        config = function()
            require("rc/plugins/filetype")
        end,
    },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Lua Library
    ----------------------------------------------------------------------------------------------------------------------------------
    --{ "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tami5/sqlite.lua" },
    { "MunifTanjim/nui.nvim" },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- nvim-treesitter
    ----------------------------------------------------------------------------------------------------------------------------------
    {
        'nvim-treesitter/nvim-treesitter',
        --event = 'VimEnter',
        build = ':TSUpdate',
        config = function()
            require('rc/plugins/nvim-treesitter')
        end,
    },
})
