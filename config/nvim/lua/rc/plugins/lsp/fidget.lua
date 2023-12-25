return {
    "j-hui/fidget.nvim",
    dependencies = { "mason.nvim" },
    config = function()
        require("fidget").setup()
    end,
}
