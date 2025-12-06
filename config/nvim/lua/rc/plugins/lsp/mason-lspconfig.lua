return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
        ensure_installed = {
            "angularls",
            "intelephense",
            "jsonls",
            "lua_ls",
            "typos_lsp",
        },
    },
    config = function(_, opts)
        require("mason-lspconfig").setup(opts)
    end,
}
