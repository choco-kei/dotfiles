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
        -- basic
        { key = 'gh', func = require('navigator.reference').async_ref, desc = 'async_ref' },
        { key = 'g0', func = require('navigator.symbols').document_symbols, desc = 'document_symbols', },
        { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live', },
        { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
        { key = 'gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
        { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview', },
        { key = 'gP', func = require('navigator.definition').type_definition_preview, desc = 'type_definition_preview', },
        { key = 'gx', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action', },
        { key = 'gx', mode = 'v', func = require('navigator.codeAction').range_code_action, desc = 'range_code_action', },
        { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
        { key = 'gr', func = require('navigator.rename').rename, desc = 'rename' },
        { key = '?', func = vim.lsp.buf.hover, desc = 'hover' },
        --{ key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },

        -- treesitter ()
        { key = '<Leader>gt', func = require('navigator.treesitter').buf_ts, desc = 'buf_ts' },
        { key = '<Leader>gT', func = require('navigator.treesitter').bufs_ts, desc = 'bufs_ts' },
        { key = ']r', func = require('navigator.treesitter').goto_next_usage, desc = 'goto_next_usage' },
        { key = '[r', func = require('navigator.treesitter').goto_previous_usage, desc = 'goto_previous_usage', },

        -- tag
        --{ key = '<Leader>ct', func = require('navigator.ctags').ctags, desc = 'ctags' },

        -- signature_help
        { key = '<M-k>', mode = 'i', func = vim.lsp.buf.signature_help, desc = 'signature_help', },
        { key = 'g?', func = vim.lsp.buf.signature_help, desc = 'signature_help', },

        -- diagnostic
        { key = 'gl', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics', },
        { key = 'gL', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics', },
        { key = '<Leader>gg', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'toggle_diagnostics', },
        { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics', },
        { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics', },
        { key = ']O', func = vim.diagnostic.set_loclist, desc = 'diagnostics set loclist', },

        -- formating
        { key = '<Space>f', mode = 'n', func = vim.lsp.buf.format, desc = 'format' },
        { key = '<Space>f', mode = 'v', func = vim.lsp.buf.range_formatting, desc = 'range format' },

        -- workspace
        { key = '<Space>wa', func = require('navigator.workspace').add_workspace_folder, desc = 'add_workspace_folder', },
        { key = '<Space>wr', func = require('navigator.workspace').remove_workspace_folder, desc = 'remove_workspace_folder', },
        { key = '<Space>wl', func = require('navigator.workspace').list_workspace_folders, desc = 'list_workspace_folders', },

        -- other
        { key = '<Space>la', mode = 'n', func = require('navigator.codelens').run_action, desc = 'run code lens action', },
        { key = '<Leader>gi', func = require('navigator.cclshierarchy').incoming_calls, desc = 'incoming_calls', },
        { key = '<Leader>go', func = require('navigator.cclshierarchy').outgoing_calls, desc = 'outgoing_calls', },
        { key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
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
