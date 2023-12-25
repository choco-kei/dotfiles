return {
    "m-demare/hlargs.nvim",
    dependencies = { "nvim-treesitter" },
    config = function()
        require("hlargs").setup({
            --color = '#88c0d0',
            excluded_filetypes = { "guihua" },
        })
    end,
}
