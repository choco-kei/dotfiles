return {
    "windwp/nvim-autopairs",
    lazy = true,
    config = function()
        require("nvim-autopairs").setup({
            --map_cr = false
        })
    end,
}
