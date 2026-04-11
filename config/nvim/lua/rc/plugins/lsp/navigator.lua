return {
    "ray-x/navigator.lua",
    enabled = true,
    --branch = "treesitter-main",
    event = "VimEnter",
    dependencies = { "nvim-lspconfig", "ray-x/guihua.lua" },
    --commit = "4b2dbdadacc31f4c9d9b673180e1ba85180e4ec9",
    --branch = "treesitter-main",
    config = function()
        -- navigator.lua のバッファフィルタリングのバグをメモリ上で修正
        local lspwrapper = require("navigator.lspwrapper")
        local nav_util = require("navigator.util")

        lspwrapper.call_async = function(method, params, handler, bufnr)
            params = params or {}
            bufnr = (bufnr == nil or bufnr == 0) and vim.api.nvim_get_current_buf() or bufnr

            -- 正しい引数 'bufnr' を使用してクライアントを取得
            local clients = vim.lsp.get_clients({ bufnr = bufnr, method = method })

            for _, client in pairs(clients) do
                if client:supports_method(method, bufnr) then
                    if type(params) == "function" then
                        params = params(client)
                    end
                    return client:request(method, params, function(...)
                        nav_util.show(...)
                        handler(...)
                    end, bufnr)
                end
            end
        end

        require("navigator").setup({
            debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log

            width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
            height = 0.3, -- max list window height, 0.3 by default
            preview_height = 0.35, -- max height of preview windows
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
            -- 'shadow', or a list of chars which defines the border
            -- The attach code will apply to all LSP clients

            ts_fold = {
                enable = false,
            },
            default_mapping = false,                              -- set to false if you will remap every key
            keymaps = {
                -- basic
                -- 参照先を検索
                -- { key = "gh", func = require("navigator.reference").async_ref,      desc = "async_ref" },
                {
                  key = "gh",
                  func = function()
                    require('telescope.builtin').lsp_references({
                      jump_type = "never"
                    })
                  end,
                  desc = "async_ref"
                },
                -- ドキュメントシンボル表示
                -- { key = "g0", func = require("navigator.symbols").document_symbols, desc = "document_symbols" },
                { key = "g0", func = false, },
                -- ワークスペースシンボル検索
                -- { key = "gw", func = require("navigator.workspace").workspace_symbol_live, desc = "workspace_symbol_live" },
                { key = "gw", func = require('telescope.builtin').lsp_dynamic_workspace_symbols, desc = "workspace_symbol_live" },
                -- 定義先にジャンプ
                -- { key = "gd", func = require("navigator.definition").definition,         desc = "definition" },
                { key = "gd", func = require('telescope.builtin').lsp_definitions, desc = "definition" },
                -- 宣言元にジャンプ
                { key = "gD", func = function() vim.lsp.buf.declaration() end,       desc = "declaration" },
                -- { key = "gD", func = require('telescope.builtin').lsp_declarations, desc = "declaration" },
                -- 定義プレビュー
                { key = "gp", func = require("navigator.definition").definition_preview, desc = "definition_preview" },
                -- 定義タイププレビュー
                {
                    key = "gP",
                    func = require("navigator.definition").type_definition_preview,
                    desc = "type_definition_preview",
                },
                -- コードアクション
                {
                    key = "gx",
                    mode = "n",
                    func = require("navigator.codeAction").code_action,
                    desc = "code_action",
                },
                -- コードアクション(range)
                {
                    key = "gx",
                    mode = "v",
                    func = require("navigator.codeAction").range_code_action,
                    desc = "range_code_action",
                },
                -- 実装先を検索
                -- { key = "gi",         func = function() vim.lsp.buf.implementation() end, desc = "implementation" },
                { key = "gi", func = require('telescope.builtin').lsp_implementations, desc = "implementation" },
                -- リネーム
                -- { key = "gr",         func = require("navigator.rename").rename,      desc = "rename" },
                { key = "gr", func = false, },
                -- ドキュメント表示
                { key = "?",          func = function() vim.lsp.buf.hover() end,          desc = "hover" },
                --{ key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },

                -- treesitter ()
                -- symbol
                { key = "<Leader>gt", func = require("navigator.treesitter").buf_ts,  desc = "buf_ts" },
                -- symbol(bufs)
                { key = "<Leader>gT", func = require("navigator.treesitter").bufs_ts, desc = "bufs_ts" },
                -- 次の定義
                {
                    key = "]r",
                    func = require("navigator.treesitter").goto_next_usage,
                    desc = "goto_next_usage",
                },
                -- 前の定義
                {
                    key = "[r",
                    func = require("navigator.treesitter").goto_previous_usage,
                    desc = "goto_previous_usage",
                },

                -- tag
                --{ key = '<Leader>ct', func = require('navigator.ctags').ctags, desc = 'ctags' },

                -- signature_help
                -- {
                --     key = "<M-k>",
                --     mode = "i",
                --     func = vim.lsp.buf.signature_help,
                --     desc = "signature_help",
                -- },
                { key = "g?", func = function() vim.lsp.buf.signature_help() end,   desc = "signature_help" },

                -- diagnostic
                -- diagnostic
                { key = "gl", func = require("navigator.diagnostics").show_diagnostics, desc = "show_diagnostics" },
                -- diagnostic(bufs)
                {
                    key = "gL",
                    func = require("navigator.diagnostics").show_buf_diagnostics,
                    desc = "show_buf_diagnostics",
                },
                -- diagnostic toggle
                {
                    key = "<Leader>gg",
                    func = require("navigator.diagnostics").toggle_diagnostics,
                    desc = "toggle_diagnostics",
                },
                -- 次の警告箇所
                { key = "]d", func = vim.diagnostic.goto_next,   desc = "next diagnostics" },
                -- 前の警告箇所
                { key = "[d", func = vim.diagnostic.goto_prev,   desc = "prev diagnostics" },
                -- loclistで開く(うごかん?)
                { key = "]O", func = vim.diagnostic.set_loclist, desc = "diagnostics set loclist" },

                -- formmating
                -- {
                --     key = "<Space>f",
                --     mode = "n",
                --     func = vim.lsp.buf.format,
                --     desc = "format",
                -- },
                {
                    key = "<Space>f",
                    mode = "n",
                    func = function()
                        -- PHPファイルでなければそのままフォーマット
                        local ft = vim.bo.filetype
                        if ft ~= "php" then
                            return vim.lsp.buf.format({ async = true })
                        end

                        -- 設定ファイル読み込み
                        local config_file_path = vim.fn.getcwd() .. "/.nvim-config.json"
                        local formatter = nil

                        if vim.fn.filereadable(config_file_path) == 1 then
                            local file = io.open(config_file_path, "r")
                            if file then
                                local content = file:read("*a")
                                file:close()
                                local success, json = pcall(vim.fn.json_decode, content)
                                if success and json.php and json.php.formatter and json.php.formatter.type then
                                    formatter = json.php.formatter.type
                                end
                            end
                        end

                        -- フォーマッター指定があれば、特定のクライアントに限定
                        if formatter then
                            vim.lsp.buf.format({
                                async = true,
                                filter = function(client)
                                    return client.name == formatter
                                end,
                            })
                        else
                            vim.lsp.buf.format({ async = true })
                        end
                    end,
                    desc = "format",
                },

                -- formmating(range)
                {
                    key = "<Space>f",
                    mode = "v",
                    func = vim.lsp.buf.range_formatting,
                    desc = "range format",
                },

                -- workspace
                -- 追加
                {
                    key = "<Space>wa",
                    func = require("navigator.workspace").add_workspace_folder,
                    desc = "add_workspace_folder",
                },
                -- 削除
                {
                    key = "<Space>wr",
                    func = require("navigator.workspace").remove_workspace_folder,
                    desc = "remove_workspace_folder",
                },
                -- リスト
                {
                    key = "<Space>wl",
                    func = require("navigator.workspace").list_workspace_folders,
                    desc = "list_workspace_folders",
                },

                -- other
                -- codelens
                {
                    key = "<Space>la",
                    mode = "n",
                    func = require("navigator.codelens").run_action,
                    desc = "run code lens action",
                },
                -- call(in)
                {
                    key = "<Leader>gi",
                    func = require("navigator.cclshierarchy").incoming_calls,
                    desc = "incoming_calls",
                },
                -- call(out)
                {
                    key = "<Leader>go",
                    func = require("navigator.cclshierarchy").outgoing_calls,
                    desc = "outgoing_calls",
                },
                --定義ジャンプ？
                { key = "<Space>D", func = vim.lsp.buf.type_definition, desc = "type_definition" },
            },
            -- a list of key maps
            -- this kepmap gK will override 'gD' mapping function declaration()  in default kepmap
            -- please check mapping.lua for all keymaps
            treesitter_analysis = true, -- treesitter variable context
            transparency = 50,          -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

            lsp_signature_help = true,  -- if you would like to hook ray-x/lsp_signature plugin in navigator
            -- setup here. if it is nil, navigator will not init signature help
            signature_help_cfg = nil,   -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
            icons = {
                -- Code action
                code_action_icon = " ",
                -- code lens
                code_lens_action_icon = "󰧶 ",
                -- Diagnostics
                diagnostic_head = " ",
                diagnostic_err = " ",
                diagnostic_warn = " ",
                diagnostic_info = " ",
                diagnostic_hint = " ",

                diagnostic_head_severity_1 = " ",
                diagnostic_head_severity_2 = " ",
                diagnostic_head_severity_3 = " ",
                diagnostic_head_description = " ",
                diagnostic_virtual_text = "",
                diagnostic_file = "",

                -- Values (floating window)
                value_definition = " ", -- identifier defined
                value_changed = " ", -- identifier modified
                context_separator = "  ", -- separator between text and value

                -- Formatting for Side Panel
                side_panel = {
                    section_separator = "󰇜",
                    line_num_left = "",
                    line_num_right = "",
                    inner_node = "├○",
                    outer_node = "╰○",
                    bracket_left = "⟪",
                    bracket_right = "⟫",
                },
                fold = {
                    prefix = "󰹹", -- icon to show before the folding need to be 2 spaces in display width
                    separator = "", -- e.g. shows   3 lines 
                },
                -- Treesitter
                match_kinds = {
                    var = "󰀫 ", -- variable
                    const = "󰏿 ",
                    method = "󰆧 ", -- method
                    -- function is a keyword so wrap in ['key'] syntax
                    ["function"] = "󰊕 ", -- function
                    parameter = " ", -- param/arg
                    parameters = " ", -- param/arg
                    required_parameter = " ", -- param/arg -- Pi
                    associated = "󱈘 ", -- linked/related
                    namespace = " ", -- namespace
                    type = "󰉿", -- type definition
                    field = "󰜢 ", -- field definition
                    module = " ", -- module
                    flag = " ", -- flag
                },
                treesitter_defult = " ",
                doc_symbols = "󰈙 ",
            },
            --lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
            lsp = {
                enable = true,
                code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = false },
                code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = false },
                format_on_save = false,                                                -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
                disable_format_cap = { "sqls", "sumneko_lua", "gopls" },               -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
                -- to disable all default config and use your own lsp setup set
                disable_lsp = "all",
                -- Default {}
                diagnostic = {
                    enable = true,
                    underline = true,
                    virtual_text = false,     -- show virtual for diagnostic message
                    update_in_insert = false, -- update diagnostic message in insert mode
                    severity_sort = { reverse = true },
                    float = {
                        focusable = false,
                        sytle = "minimal",
                        border = "rounded",
                        source = "always",
                        header = "",
                        prefix = " ",
                    },
                },

                diagnostic_scrollbar_sign = false,   -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
                -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
                diagnostic_virtual_text = false,     -- show virtual for diagnostic message
                diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
                display_diagnostic_qf = false,       -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
            },
        })

        vim.cmd("autocmd FileType guihua lua vim.b.completion = false")
        vim.cmd("autocmd FileType guihua_rust lua vim.b.completion = false")

        -- folding
        -- vim.o.foldlevel = 2
        -- vim.opt.fillchars = { foldclose = "", foldopen = "", fold = " " }
    end,
}
