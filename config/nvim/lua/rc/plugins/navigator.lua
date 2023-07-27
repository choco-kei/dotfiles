require'navigator'.setup({
    debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
    width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
    height = 0.3, -- max list window height, 0.3 by default
    preview_height = 0.35, -- max height of preview windows
    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'}, -- border style, can be one of 'none', 'single', 'double',
    -- 'shadow', or a list of chars which defines the border
    on_attach = function(client, bufnr)
        -- your hook
    end,
    -- put a on_attach of your own here, e.g
    -- function(client, bufnr)
    --   -- the on_attach will be called at end of navigator on_attach
    -- end,
    -- The attach code will apply to all LSP clients

    default_mapping = false,  -- set to false if you will remap every key
    keymaps = {
        -- basic (g)
        { key = 'gh', func = "require('navigator.reference').async_ref()" },
        { key = 'g0', func = "require('navigator.symbols').document_symbols()" },
        { key = 'gW', func = "require('navigator.workspace').workspace_symbol()" },
        { key = 'gd', func = "require('navigator.definition').definition()" },
        { key = 'gD', func = "declaration({ border = 'rounded', max_width = 80 })" },
        { key = 'gp', func = "require('navigator.definition').definition_preview()" },
        { key = 'gx', mode = 'n', func = "require('navigator.codeAction').code_action()" },
        { key = 'gx', mode = 'v', func = 'range_code_action()' },
        { key = 'gi', func = 'implementation()' },
        { key = 'gr', func = "require('navigator.rename').rename()" },
        { key = '?', func = 'hover({ popup_opts = { border = single, max_width = 80 }})' },
        --{ key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },

        -- treesitter ()
        { key = '<Leader>gt', func = "require('navigator.treesitter').buf_ts()" },
        { key = '<Leader>gT', func = "require('navigator.treesitter').bufs_ts()" },
        { key = ']r', func = "require('navigator.treesitter').goto_next_usage()" },
        { key = '[r', func = "require('navigator.treesitter').goto_previous_usage()" },

        -- signature_help
        { key = 'g?', mode = 'i', func = 'signature_help()' },
        { key = 'g?', func = 'signature_help()' },

        -- diagnostic
        { key = 'gl', func = "require('navigator.diagnostics').show_diagnostics()" },
        { key = 'gL', func = "require('navigator.diagnostics').show_buf_diagnostics()" },
        { key = '<Leader>gg', func = "require('navigator.diagnostics').toggle_diagnostics()" },
        { key = ']d', func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})" },
        { key = '[d', func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})" },
        { key = ']O', func = 'diagnostic.set_loclist()' },

        -- formating
        { key = '<Space>f', func = "format({async = false})", mode = 'n' },
        { key = '<Space>f', func = "range_formatting()", mode = 'v' },

        -- workspace
        { key = '<Space>wa', func = "require('navigator.workspace').add_workspace_folder()" },
        { key = '<Space>wr', func = "require('navigator.workspace').remove_workspace_folder()" },
        { key = '<Space>wl', func = "require('navigator.workspace').list_workspace_folders()" },

        -- other
        { key = '<Space>la', mode = 'n', func = "require('navigator.codelens').run_action()" },
        { key = '<Leader>gi', func = 'incoming_calls()' },
        { key = '<Leader>go', func = 'outgoing_calls()' },
        { key = '<Space>D', func = 'type_definition()' },
    },
    -- a list of key maps
    -- this kepmap gK will override 'gD' mapping function declaration()  in default kepmap
    -- please check mapping.lua for all keymaps
    treesitter_analysis = true, -- treesitter variable context
    transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

    lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
    -- setup here. if it is nil, navigator will not init signature help
    signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
    icons = {
        -- Code action
        code_action_icon = '',
        -- code lens
        code_lens_action_icon = '',
        -- Diagnostics
        diagnostic_head = '',
        diagnostic_err = '',
        diagnostic_warn = '',
        diagnostic_info = '',
        diagnostic_hint = '',

        diagnostic_head_severity_1 = '',
        diagnostic_head_severity_2 = '',
        diagnostic_head_severity_3 = '',
        diagnostic_head_description = ' ',
        diagnostic_virtual_text = '',
        diagnostic_file = '',

        -- Values
        value_changed = '',
        value_definition = '', -- it is easier to see than 🦕
        side_panel = {
            section_separator = '',
            line_num_left = '',
            line_num_right = '',
            inner_node = '├○',
            outer_node = '╰○',
            bracket_left = '⟪',
            bracket_right = '⟫',
        },
        -- Treesitter
        match_kinds = {
            var = '', -- "👹", -- Vampaire
            method = '', --  "🍔", -- mac
            ['function'] = ' ', -- "🤣", -- Fun
            parameter = '  ', -- Pi
            associated = '🤝',
            namespace = '🚀',
            type = ' ',
            field = '🏈',
            module = '📦',
            flag = '🎏',
        },
        treesitter_defult = '🌲',
        doc_symbols = '',
    },
    --lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
    mason = true, -- set to true if you would like use the lsp installed by williamboman/mason
    lsp = {
        enable = true,
        code_action = {enable = true, sign = true, sign_priority = 40, virtual_text = false},
        code_lens_action = {enable = true, sign = true, sign_priority = 40, virtual_text = false},
        format_on_save = false, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
        disable_format_cap = {'sqls', 'sumneko_lua', 'gopls'},  -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
        disable_lsp = {'pylsd', 'sqls', 'phpactor'}, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
        -- only want to enable one lsp server
        -- to disable all default config and use your own lsp setup set
        -- disable_lsp = 'all'
        -- Default {}
        diagnostic = {
            underline = true,
            virtual_text = false, -- show virtual for diagnostic message
            update_in_insert = false, -- update diagnostic message in insert mode
        },

        diagnostic_scrollbar_sign = false, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
        -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
        diagnostic_virtual_text = false,  -- show virtual for diagnostic message
        diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
        display_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
        tsserver = {
            filetypes = {'typescript'} -- disable javascript etc,
            -- set to {} to disable the lspclient for all filetypes
        },
        gopls = {   -- gopls setting
            on_attach = function(client, bufnr)  -- on_attach for gopls
                -- your special on attach here
                -- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
                print('i am a hook, I will disable document format')
                client.resolved_capabilities.document_formatting = false
            end,
            settings = {
                gopls = {gofumpt = false} -- disable gofumpt etc,
            }
        },
        --sumneko_lua = {
        --    sumneko_root_path = vim.fn.expand("$HOME") .. '/github/sumneko/lua-language-server',
        --    sumneko_binary = vim.fn.expand("$HOME") .. '/github/sumneko/lua-language-server/bin/macOS/lua-language-server',
        --},
        servers = {'cmake', 'ltex'}, -- by default empty, and it should load all LSP clients avalible based on filetype
        -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
        -- can put them in the `servers` list and navigator will auto load them.
        -- you could still specify the custom config  like this
        -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
    }
})

vim.cmd("autocmd FileType guihua lua require('cmp').setup.buffer { enabled = false }")
vim.cmd("autocmd FileType guihua_rust lua require('cmp').setup.buffer { enabled = false }")
