local actions = require('telescope.actions')
local action_layout = require('telescope.actions.layout')
local config = require('telescope.config')
local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local conf = require('telescope.config').values
local telescope_builtin = require('telescope.builtin')
local Path = require('plenary.path')

local action_state = require('telescope.actions.state')
local custom_actions = {}

require('telescope').setup({
    defaults = {
        preview = {
            filesize_limit = 1,
            timeout = 250,
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        prompt_prefix = '> ',
        selection_caret = '> ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        layout_config = {
            width = 0.8,
            horizontal = {
                mirror = false,
                prompt_position = 'top',
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            preview_cutoff = 120,
        },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        scroll_strategy = 'cycle',
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

        extensions = {
            frecency = {
                ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
                db_safe_mode = false
            },
            file_browser = {
                mappings = {
                },
            },
        },

        mappings = {
            n = {
                ['<C-g>'] = actions.close, -- C-gで閉じる
            },
            i = {
                ['<C-g>'] = actions.close, -- C-gで閉じる
            },
        },
    },
})

-- キーマップ
vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', "<Cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git', }})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fr', '<Cmd>Telescope resume<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', '<Cmd>Telescope file_browser path=%:p:h<CR>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>fm', "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', "<Cmd>lua require('telescope').extensions.frecency.frecency({ default_workspace = 'CWD' })<CR>", { noremap = true, silent = true })

-- telescopeで開く場合にfoldingが効かない問題対策(zxする)
vim.api.nvim_create_autocmd('BufRead', {
    callback = function()
        vim.api.nvim_create_autocmd('BufWinEnter', {
            once = true,
            command = 'normal! zx'
        })
    end
})
