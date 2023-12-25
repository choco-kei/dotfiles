return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    config = function()
        local lspconfig = require("mason-lspconfig")
    end,
}
