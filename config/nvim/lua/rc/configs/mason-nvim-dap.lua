require("mason-nvim-dap").setup({
    ensure_installed = { "php" },

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
    handlers = {
        function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
        end,
        php = function(config)
            config.adapters = {
                type = "executable",
                command = "/usr/bin/python3",
                args = {
                    "-m",
                    "debugpy.adapter",
                },
            }
            config.adapters = {
                type = "executable",
                command = "php-debug-adapter",
                --args = { vim.fn.expand('~/tool/vscode-php-debug/out/phpDebug.js') }
                --args = { vim.fn.expand("~/tool/vscode-php-debug/out/phpDebug.js") },
            }

            config.configurations = {
                {
                    type = "php",
                    request = "launch",
                    name = "Listen for Xdebug",
                    port = 9003,
                    pathMappings = {
                        ["/var/www/app"] = "${workspaceFolder}",
                        ["/work"]        = "${workspaceFolder}",
                    },
                },
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
    },
})
