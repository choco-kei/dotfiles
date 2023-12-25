return {
    "yioneko/nvim-yati",
    dependencies = "nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup({
            yati = {
                enable = true,
                suppress_conflict_warning = true,
            },
        })
    end,
}
