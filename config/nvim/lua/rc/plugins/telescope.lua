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

local function join_uniq(tbl, tbl2)
    local res = {}
    local hash = {}
    for _, v1 in ipairs(tbl) do
        res[#res + 1] = v1
        hash[v1] = true
    end

    for _, v in pairs(tbl2) do
        if not hash[v] then
            table.insert(res, v)
        end
    end
    return res
end

local function filter_by_cwd_paths(tbl, cwd)
    local res = {}
    local hash = {}
    for _, v in ipairs(tbl) do
        if v:find(cwd, 1, true) then
            local v1 = Path:new(v):normalize(cwd)
            if not hash[v1] then
                res[#res + 1] = v1
                hash[v1] = true
            end
        end
    end
    return res
end

local function requiref(module)
    require(module)
end

-- mru
telescope_builtin.my_mru = function(opts)
    local get_mru = function(opts)
        local res = pcall(requiref, 'telescope._extensions.frecency')
        if not res then
            return vim.tbl_filter(function(val)
                return 0 ~= vim.fn.filereadable(val)
            end, vim.v.oldfiles)
        else
            local db_client = require('telescope._extensions.frecency.db_client')
            db_client.init()
            -- too slow
            -- local tbl = db_client.get_file_scores(opts, vim.fn.getcwd())
            local tbl = db_client.get_file_scores(opts)
            local get_filename_table = function(tbl)
                local res = {}
                for _, v in pairs(tbl) do
                    res[#res + 1] = v['filename']
                end
                return res
            end
            return get_filename_table(tbl)
        end
    end
    local results_mru = get_mru(opts)
    local results_mru_cur = filter_by_cwd_paths(results_mru, vim.loop.cwd())

    local show_untracked = utils.get_default(opts.show_untracked, true)
    local recurse_submodules = utils.get_default(opts.recurse_submodules, false)
    if show_untracked and recurse_submodules then
        error('Git does not suppurt both --others and --recurse-submodules')
    end
    local cmd = {
        'git',
        'ls-files',
        '--exclude-standard',
        '--cached',
        show_untracked and '--others' or nil,
        recurse_submodules and '--recurse-submodules' or nil,
    }
    local results_git = utils.get_os_command_output(cmd)

    local results = join_uniq(results_mru_cur, results_git)

    pickers.new(opts, {
        prompt_title = 'MRU',
        finder = finders.new_table({
            results = results,
            entry_maker = opts.entry_maker or make_entry.gen_from_file(opts),
        }),
        -- default_text = vim.fn.getcwd(),
        sorter = conf.file_sorter(opts),
        previewer = conf.file_previewer(opts),
    }):find()
end

-- キーマップ
vim.api.nvim_set_keymap('n', '<Leader>ff', '<Cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', "<Cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git', }})<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<Cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<Cmd>Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>fm', '<Cmd>Telescope my_mru<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ft', '<Cmd>Telescope file_browser path=%:p:h<CR>', { noremap = true, silent = true })

-- telescopeで開く場合にfoldingが効かない問題対策(zxする)
vim.api.nvim_create_autocmd('BufRead', {
    callback = function()
        vim.api.nvim_create_autocmd('BufWinEnter', {
            once = true,
            command = 'normal! zx'
        })
    end
})
