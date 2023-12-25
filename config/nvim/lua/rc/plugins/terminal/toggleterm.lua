return {
    "akinsho/toggleterm.nvim",
    keys = { "<C-_>" },
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-_>]],
            direction = "horizontal",
        })
    end,
}
