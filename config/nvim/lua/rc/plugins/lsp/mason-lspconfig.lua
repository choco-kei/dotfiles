return {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        mason.setup()

        mason_lspconfig.setup()

        --mason_lspconfig.setup_handlers({
        --    function(server_name)
        --        lspconfig[server_name].setup({
        --            on_attach = function(client, bufnr)
        --                -- [[ other on_attach code ]]
        --                require("illuminate").on_attach(client)

        --                if client.server_capabilities["documentSymbolProvider"] then
        --                    require("nvim-navic").attach(client, bufnr)
        --                end
        --            end,
        --        })
        --    end,

        --    ["intelephense"] = function()
        --        lspconfig.intelephense.setup({
        --            settings = {
        --                intelephense = {
        --                    files = {
        --                        maxSize = 5000000,
        --                    },
        --                },
        --            },
        --        })
        --    end,
        --})
    end,
}
