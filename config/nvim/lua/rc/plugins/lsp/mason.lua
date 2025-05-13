return {
    "williamboman/mason.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lspconfig", "mason-lspconfig.nvim", "nlsp-settings.nvim" },
    --build = ":MasonUpdate",
    config = function()
        local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        require("mason").setup({})
    end,
}
