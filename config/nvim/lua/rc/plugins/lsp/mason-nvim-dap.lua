return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
        require("mason-nvim-dap").setup({
            -- 1. インストールしたいアダプタをmasonのパッケージ名で記述
            ensure_installed = {
                "php-debug-adapter", -- "php" ではなく、masonでのパッケージ名を指定
                "debugpy",           -- "python" ではなく、masonでのパッケージ名を指定
            },

            automatic_installation = false,

            -- 2. ハンドラで言語ごとの「起動設定(configurations)」を定義
            handlers = {
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
