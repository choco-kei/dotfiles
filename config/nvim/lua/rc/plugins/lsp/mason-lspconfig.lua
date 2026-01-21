return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
        ensure_installed = {
            -- lua
            "lua_ls",

            -- php
            "intelephense",

            -- go
            "gopls",

            -- ts
            "ts_ls",

            -- json
            "jsonls",

            -- proto
            "buf_ls",

            -- typo
            "typos_lsp",
        },
    },
}
