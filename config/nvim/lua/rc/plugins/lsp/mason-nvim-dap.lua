return {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = true,
    config = function()
        require("mason-nvim-dap").setup({
            -- 1. インストールしたいアダプタをリストに記述
            ensure_installed = { "php", "python" },

            -- NOTE: this is left here for future porting in case needed
            -- Whether adapters that are set up (via dap) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Daps are not automatically installed.
            --   - true: All adapters set up via dap are automatically installed.
            --   - { exclude: string[] }: All adapters set up via mason-nvim-dap, except the ones provided in the list, are automatically installed.
            --       Example: automatic_installation = { exclude = { "python", "delve" } }
            automatic_installation = false,

            -- See below on usage
            -- 2. ハンドラで言語ごとの「起動設定(configurations)」を定義
            handlers = {
                -- デフォルトハンドラ：特別な設定がない他の言語はここで処理
                function(config)
                    -- all sources with no handler get passed here

                    -- Keep original functionality
                    require("mason-nvim-dap").default_setup(config)
                end,

                -- PHP用の起動設定
                php = function(config)
                    config.configurations = {
                        {
                            type = "php",
                            request = "launch",
                            name = "Listen for Xdebug",
                            port = 9003,
                            pathMappings = {
                                ["/var/www/app"] = "${workspaceFolder}",
                                ["/work"] = "${workspaceFolder}",
                            },
                        },
                    }
                    require("mason-nvim-dap").default_setup(config)
                end,

                -- Python用の起動設定
                python = function(config)
                    config.configurations = {
                        {
                            name = "Launch file",
                            type = "python",
                            request = "launch",
                            program = "${file}", -- 現在のファイルを実行
                            console = "integratedTerminal",
                        },
                    }
                    require("mason-nvim-dap").default_setup(config)
                end,
            },
        })
    end,
}
