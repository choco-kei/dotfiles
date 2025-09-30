return {
    "neovim/nvim-lspconfig",
    event = "VimEnter",
    config = function()
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
