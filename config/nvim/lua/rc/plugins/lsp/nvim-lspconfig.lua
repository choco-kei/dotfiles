return {
    "neovim/nvim-lspconfig",
    version = "v2.5.0",
    event = "VimEnter",
    config = function()
        local on_attach = function(client, bufnr)
        end

        -- This is the single source of truth for LSP capabilities.
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        -- nvim-ufo(folding)
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        -- Set the global capabilities for all LSP servers
        vim.lsp.config("*", {
            on_attach = on_attach,
            capabilities = capabilities
        })

        -- lua_ls
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })

        -- intelephense
        vim.lsp.config("intelephense", {
            settings = {
                intelephense = {
                    maxMemory = 256,
                    files = {
                        maxSize = 1300000,
                    },
                },
            },
        })

        -- gopls
        -- vim.lsp.config("gopls", {
        -- })

        -- ts_ls
        vim.lsp.config("ts_ls", {
            filetypes = { "typescript" },
        })

        -- buf_ls
        vim.lsp.config("buf_ls", {
            filetypes = { "proto" },
        })

        -- typos_lsp
        vim.lsp.config("typos_lsp", {
            init_options = {
                config = "~/.config/nvim/spell/typos.toml",
            },
        })

        -- Lspsagaのgrと競合するデフォルトLSPキーマップを削除
        local del_keys = { "grt", "gri", "grr", "gra", "grn" }
        for _, key in ipairs(del_keys) do
            vim.keymap.del("n", key)
        end
    end,
}
