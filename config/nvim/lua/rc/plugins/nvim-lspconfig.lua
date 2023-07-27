local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
    on_attach = function(client, bufnr)
        -- [[ other on_attach code ]]
        require('illuminate').on_attach(client)

        if client.server_capabilities['documentSymbolProvider'] then
            require('nvim-navic').attach(client, bufnr)
        end
    end,
}

lspconfig.intelephense.setup {
    autostart = true,
    on_attach = function(client, bufnr)
        -- [[ other on_attach code ]]
        require('illuminate').on_attach(client)

        if client.server_capabilities['documentSymbolProvider'] then
            vim.notify('intelephense.navic.attach')
            require('nvim-navic').attach(client, bufnr)
        end
    end,
}
--lspconfig.sumneko_lua.setup {}
--lspconfig.tsserver.setup {}
