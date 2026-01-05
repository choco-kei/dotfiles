return {
    "mason-org/mason.nvim",
    --version = "^1.0.0",
    dependencies = { "neovim/nvim-lspconfig" },
    --build = ":MasonUpdate",
    config = function()
        --vim.diagnostic.config({
        --    signs = {
        --        active = true,
        --        values = {
        --            { name = "DiagnosticSignError", text = "", texthl = "DiagnosticSignError" },
        --            { name = "DiagnosticSignWarn",  text = "", texthl = "DiagnosticSignWarn" },
        --            { name = "DiagnosticSignInfo",  text = "", texthl = "DiagnosticSignInfo" },
        --            { name = "DiagnosticSignHint",  text = "󰌶", texthl = "DiagnosticSignHint" },
        --        },
        --    },
        --})

        require("mason").setup({})
    end,
}
