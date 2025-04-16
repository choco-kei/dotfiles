return {
    "nvimtools/none-ls.nvim",
    event = "VimEnter",
    dependencies = "mason.nvim",
    config = function()
        local null_ls = require("null-ls")

        local sources = {}

        -- 設定ファイル読み込み
        local formatter_config = {}
        local config_file_path = ".nvim-config.json"
        if vim.fn.filereadable(config_file_path) == 1 then
            local lines = vim.fn.readfile(config_file_path)
            if #lines > 0 then
                formatter_config = vim.fn.json_decode(table.concat(lines, "\n"))
            end
        end

        -- PHPのformatter/linter設定を抽出
        local php_config = formatter_config["php"] or {}

        -- PHP linter と formatter の有効無効を決定
        local php_formatter_args = nil
        local php_linter_args = nil

        -- php設定がJSONにない場合、linter と formatter を無効化
        if php_config.formatter and php_config.formatter.args then
            php_formatter_args = php_config.formatter.args
        end

        if php_config.linter and php_config.linter.args then
            php_linter_args = php_config.linter.args
        end

        -- PHP linter(phpcs)を設定（設定がない場合は無効）
        if php_linter_args then
            table.insert(
                sources,
                null_ls.builtins.diagnostics.phpcs.with({
                    extra_args = { "--standard=" .. php_linter_args },
                })
            )
        end

        -- PHP formatter(phpcbf)を設定（設定がない場合は無効）
        if php_formatter_args then
            table.insert(
                sources,
                null_ls.builtins.formatting.phpcbf.with({
                    extra_args = { "--standard=" .. php_formatter_args },
                })
            )
        end

        -- Lua formatter(常に有効)
        table.insert(sources, null_ls.builtins.formatting.stylua)

        -- null-ls を設定
        null_ls.setup({
            sources = sources,
            debug = false,
        })
    end,
}
