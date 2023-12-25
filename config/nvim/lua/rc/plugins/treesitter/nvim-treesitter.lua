return {
    "nvim-treesitter/nvim-treesitter",
    --event = "VimEnter",
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
        })
    end,
}
