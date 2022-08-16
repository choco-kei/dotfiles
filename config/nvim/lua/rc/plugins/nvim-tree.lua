
require('nvim-tree').setup({
    --auto_reload_on_write = true,
    --create_in_closed_folder = false,
    --disable_netrw = false,
    hijack_cursor = true,
    --hijack_netrw = true,
    --hijack_unnamed_buffer_when_opening = false,
    --ignore_buffer_on_setup = false,
    --open_on_setup = false,
    --open_on_setup_file = false,
    --open_on_tab = false,
    --ignore_buf_on_tab_change = {},
    --sort_by = 'name',
    --root_dirs = {},
    --prefer_startup_root = false,
    --sync_root_with_cwd = false,
    --reload_on_bufenter = false,
    --respect_buf_cwd = false,
    --on_attach = 'disable', -- function(bufnr). If nil, will use the deprecated mapping strategy
    --remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs)

    view = {
        --adaptive_size = false,
        --centralize_selection = false,
        --width = 30,
        --height = 30,
        hide_root_folder = true,
        --side = 'left',
        --preserve_window_proportions = false,
        --number = false,
        --relativenumber = false,
        --signcolumn = 'yes',
        -- @deprecated
        --mappings = {
        --    custom_only = false,
        --    list = {
        --        -- user mappings go here
        --    },
        --},
        --float = {
        --    enable = true,
        --    open_win_config = {
        --        relative = 'editor',
        --        border = 'rounded',
        --        width = 30,
        --        height = 30,
        --        row = 1,
        --        col = 1,
        --    },
        --},
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = true,
        highlight_opened_files = 'none',
        root_folder_modifier = ':~',
        indent_markers = {
            enable = true,
            inline_arrows = false,
            icons = {
                corner = '└',
                edge = '│',
                item = '│',
                none = ' ',
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = ' ➛ ',
            show = {
                file = true,
                folder = true,
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                default = '',
                symlink = '',
                bookmark = '',
                folder = {
                    arrow_closed = '',
                    arrow_open = '',
                    default = '',
                    open = '',
                    empty = '',
                    empty_open = '',
                    symlink = '',
                    symlink_open = '',
                },
                git = {
                    unstaged = '',
                    staged = '',
                    unmerged = '',
                    renamed = '➜',
                    untracked = '★',
                    deleted = '',
                    ignored = '◌',
                },
            },
        },
        special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
        symlink_destination = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '',
        },
    },
    filters = {
        dotfiles = false,
        custom = { '^\\.DS_Store' }
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "rounded",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = false,
        },
    },
})

-- keymap
vim.keymap.set('n', '[tree]', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>t', '[tree]', { remap = true, silent = true })

vim.keymap.set('n', '[tree]t', ':NvimTreeToggle<CR>', { remap = true, silent = true }) -- tt トグル
vim.keymap.set('n', '[tree]c', ':NvimTreeFindFile<CR>', { remap = true, silent = true }) -- tn カレントバッファーのディレクトリを開く

-- treeのバックグラウンド
vim.cmd([[hi NvimTreeNormal guibg=none]])
