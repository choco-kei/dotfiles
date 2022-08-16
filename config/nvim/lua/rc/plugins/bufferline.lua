require('bufferline').setup({
    options = {
        mode = 'buffers', -- set to 'tabs' to only show tabpages instead
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.ordinal))
        end,
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains a 'name', 'path' and 'bufnr'
            -- remove extension from markdown files for example
            if buf.name:match('%.md') then
                return vim.fn.fnamemodify(buf.name, ':t:r')
            end
        end,
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',

		show_buffer_close_icons = false,
		show_close_icon = false,
        enforce_regular_tabs = true,

        sort_by = 'insert_after_current',
        --separator_style = 'thick'
        offsets = {
            {
                filetype = 'NvimTree',
                text = function()
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
                end,
                highlight = 'Directory',
                text_align = 'left'
            },
        },
    },
    highlights = {
        fill = {
            bg = '#222730',
        },
        --indicator_selected = {
        --    fg = '#87a0be',
        --},
    },
})

-- タブ操作
vim.keymap.set('n', '[tab]', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('n', 't', '[tab]', { remap = true, silent = true })
vim.keymap.set('n', '[tab]n', ':tabnew<CR>', { remap = true, silent = true }) -- tn 新規タブ
vim.keymap.set('n', '[tab]q', ':bd<CR>', { remap = true, silent = true }) -- tn タブ閉じ(バッファー閉じ)
--vim.keymap.set('n', '[tab]n', ':tabnew<CR>', { remap = true, silent = true }) -- tn 新規タブ
--vim.keymap.set('n', '[tab]l', ':tabnext<CR>', { remap = true, silent = true }) -- tl 次のタブ
--vim.keymap.set('n', '[tab]h', ':tabprevious<CR>', { remap = true, silent = true }) -- th 前のタブ

-- bufferline
vim.api.nvim_set_keymap('n', '[tab]p', '<Cmd>BufferLinePick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]h', '<Cmd>BufferLineCyclePrev<CR>', { noremap = true, silent = true }) -- th 前のタブ
vim.api.nvim_set_keymap('n', '[tab]l', '<Cmd>BufferLineCycleNext<CR>', { noremap = true, silent = true }) -- tl 次のタブ
vim.api.nvim_set_keymap('n', '[tab]mh', '<Cmd>BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]ml', '<Cmd>BufferLineMoveNext<CR>', { noremap = true, silent = true })

-- タブ番号指定
vim.api.nvim_set_keymap('n', '[tab]1', '<Cmd>BufferLineGoToBuffer 1<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]2', '<Cmd>BufferLineGoToBuffer 2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]3', '<Cmd>BufferLineGoToBuffer 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]4', '<Cmd>BufferLineGoToBuffer 4<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]5', '<Cmd>BufferLineGoToBuffer 5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]6', '<Cmd>BufferLineGoToBuffer 6<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]7', '<Cmd>BufferLineGoToBuffer 7<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]8', '<Cmd>BufferLineGoToBuffer 8<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[tab]9', '<Cmd>BufferLineGoToBuffer 9<CR>', { noremap = true, silent = true })
