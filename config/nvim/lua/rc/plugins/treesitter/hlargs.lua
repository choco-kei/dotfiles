return {
    "m-demare/hlargs.nvim",
    lazy = true,
    dependencies = { "nvim-treesitter" },
    config = function()
        require("hlargs").setup({
            --color = '#88c0d0',
            excluded_filetypes = { "guihua" },
        })
    end,
}
