return {
    "neovim/nvim-lspconfig",
    version = "v2.5.0",
    event = "VimEnter",
    config = function()
        -- This is the single source of truth for LSP capabilities.
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Add capabilities for nvim-ufo (folding)
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- Set the global capabilities for all LSP servers
        vim.lsp.config("*", { capabilities = capabilities })

        -- Per-server configurations will be merged with the global settings above
        vim.lsp.config('typos_lsp', {
            init_options = {
                config = "~/.config/nvim/spell/typos.toml",
            },
        })

        --    --lspconfig.gopls.setup({
        --    --    on_attach = function(client, bufnr)
        --    --        -- [[ other on_attach code ]]
        --    --        require("illuminate").on_attach(client)

        --    --        if client.server_capabilities["documentSymbolProvider"] then
        --    --            require("nvim-navic").attach(client, bufnr)
        --    --        end
        --    --    end,
        --    --})

        --    --lspconfig.intelephense.setup({
        --    --    --on_attach = function(client, bufnr)
        --    --    --    -- [[ other on_attach code ]]
        --    --    --    require("illuminate").on_attach(client)

        --    --    --    if client.server_capabilities["documentSymbolProvider"] then
        --    --    --        require("nvim-navic").attach(client, bufnr)
        --    --    --    end
        --    --    --end,
        --    --})

        --    --lspconfig.bufls.setup {
        --    --    on_attach = function(client, bufnr)
        --    --        -- [[ other on_attach code ]]
        --    --        require('illuminate').on_attach(client)
        --    --
        --    --        if client.server_capabilities['documentSymbolProvider'] then
        --    --            require('nvim-navic').attach(client, bufnr)
        --    --        end
        --    --    end,
        --    --}
        --    --lspconfig.sumneko_lua.setup {}
        --    --lspconfig.tsserver.setup {}
    end,
}
