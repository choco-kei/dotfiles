return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        COLOR_SCHEME,
        "p00f/nvim-ts-rainbow",
        "m-demare/hlargs.nvim",
        "JoosepAlviste/nvim-ts-context-commentstring",
        "yioneko/nvim-yati",
        "haringsrob/nvim_context_vt",
        "David-Kunz/treesitter-unit",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    event = "VimEnter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = "all", -- one of 'all', 'language', or a list of languages

            --ignore_install = { 'javascript' },

            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {},  -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = { -- mappings for incremental selection (visual mappings)
                    -- node_incremental = 'grn', -- increment to the upper named parent
                    -- scope_incremental = 'grc', -- increment to the upper scope (as defined in locals.scm)
                    -- init_selection = 'gnn', -- maps in normal mode to init the node/scope selection
                    -- node_decremental = 'grm' -- decrement to the previous node
                    --init_selection = '<CR>',
                    --scope_incremental = '<CR>',
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            indent = { enable = true, disable = { "php" } },
            --textsubjects = {
            --    enable = false,
            --    -- prev_selection = 'Q',
            --    keymaps = {
            --        ['.'] = 'textsubjects-smart',
            --        ['<Tab>'] = 'textsubjects-container-outer',
            --        ['<S-Tab>'] = 'textsubjects-container-inner',
            --    },
            --},
            --pairs = {
            --    enable = false,
            --    disable = {},
            --    highlight_pair_events = { 'CursorMoved' }, -- when to highlight the pairs, use {} to deactivate highlighting
            --    highlight_self = true,
            --    goto_right_end = false, -- whether to go to the end of the right partner or the beginning
            --    fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. 'normal! %')
            --    keymaps = { goto_partner = "'%" },
            --},
            --matchup = {
            --    enable = false,
            --    disable = {},
            --},
            rainbow = {
                enable = true,
                -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                max_file_lines = 300, -- Do not enable for files with more than n lines, int
                -- colors = {}, -- table of hex strings
                -- termcolors = {} -- table of colour name strings
            },
            textobjects = { -- syntax-aware textobjects
                select = {
                    enable = true,
                    disable = {},
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["iB"] = "@block.inner",
                        ["aB"] = "@block.outer",
                        -- use sandwich
                        -- ['i'] = '@call.inner',
                        -- ['a'] = '@call.outer',
                        -- ['a'] = '@comment.outer',
                        -- ['iF'] = '@frame.inner',
                        -- ['oF'] = '@frame.outer',
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                        ["il"] = "@loop.inner",
                        ["al"] = "@loop.outer",
                        ["ip"] = "@parameter.inner",
                        ["ap"] = "@parameter.outer",
                        -- ['iS'] = '@scopename.inner',
                        -- ['aS'] = '@statement.outer',
                    },
                },
                --swap = {
                --    enable = true,
                --    swap_next = { ["'>"] = '@parameter.inner' },
                --    swap_previous = { ["'<"] = '@parameter.inner' },
                --},
                --move = {
                --    enable = true,
                --    goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
                --    goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
                --    goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
                --    goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
                --},
            },
            yati = {
                enable = true,
                suppress_conflict_warning = true,
            },
        })
    end,
}
