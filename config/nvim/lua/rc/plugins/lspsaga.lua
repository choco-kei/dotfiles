require('lspsaga').setup({
    preview = {
        lines_above = 0,
        lines_below = 10,
    },
    scroll_preview = {
        scroll_down = '<C-f>',
        scroll_up = '<C-b>',
    },
    request_timeout = 2000,
    finder = {
        edit = { 'o', '<CR>' },
        vsplit = 'v',
        split = 's',
        tabe = 'c',
        quit = { 'q', '<ESC>', '<C-g>' },
    },
    definition = {
        edit = '<C-c>o',
        vsplit = '<C-c>v',
        split = '<C-c>s',
        tabe = '<C-c>c',
        quit = { 'q', '<C-g>'},
        close = '<Esc>',
    },
    diagnostic = {
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        keys = {
            exec_action = { 'o', '<CR>' },
            quit = { 'q', '<ESC>', 'C-g' },
            go_action = 'g'
        },
    },
    rename = {
        quit =  '<ESC>',
        exec = '<CR>',
        mark = 'x',
        confirm = '<CR>',
        in_select = true,
        whole_project = true,
    },
    outline = {
        win_position = 'right',
        win_with = '',
        win_width = 40,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        auto_close = true,
        custom_sort = nil,
        keys = {
            jump = 'o',
            expand_collapse = 't',
            quit = 'q',
        },
    },
    callhierarchy = {
        show_detail = true,
        keys = {
            edit = 'e',
            vsplit = 'v',
            split = 's',
            tabe = 'c',
            jump = 'o',
            quit = { 'q', '<ESC>', 'C-g' },
            expand_collapse = 't',
        },
    },
    -- nvim-cmp時にcmdheightが増える。。
    symbol_in_winbar = {
        enable = true,
        separator = '  ',
        hide_keyword = true,
        show_file = true,
        folder_level = 2,
        respect_root = false,
        color_mode = true,
    },
    ui = {
        -- currently only round theme
        theme = 'round',
        -- this option only work in neovim 0.9
        title = true,
        -- border type can be single,double,rounded,solid,shadow.
        border = 'solid',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '',
        diagnostic = '',
        incoming = ' ',
        outgoing = ' ',
        colors = {
            --float window normal background color
            normal_bg = '#232831',
            --title background color
            title_bg = '#39404f',
            red = '#bf616a',
            magenta = '#b48ead',
            orange = '#c9826b',
            yellow = '#ebcb8b',
            green = '#a3be8c',
            cyan = '#88c0d0',
            blue = '#81a1c1',
            purple = '#bf88bc',
            white = '#e5e9f0',
            black = '#3b4252',
        },
        kind = {},
    },
})

-- highlight
vim.cmd('highlight TitleString guibg=#39404f guifg=#bbc3d4')

-- lsp keymap
vim.keymap.set('n', '<Space>f', '<CMD>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')

-- Code action
keymap({'n','v'}, 'gx', '<cmd>Lspsaga code_action<CR>')

-- Rename
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')

-- Go to Definition
keymap('n','gd', '<cmd>Lspsaga goto_definition<CR>')

-- Show line diagnostics you can pass argument ++unfocus to make
-- show_line_diagnostics float window unfocus
keymap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Show cursor diagnostic
-- also like show_line_diagnostics  support pass ++unfocus
keymap('n', 'gc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')

-- Show buffer diagnostic
keymap('n', 'gb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

-- Diagnostic jump can use `<c-o>` to jump back
keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

-- Diagnostic jump with filter like Only jump to error
keymap('n', '[E', function()
  require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap('n', ']E', function()
  require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle Outline
keymap('n','g0', '<cmd>Lspsaga outline<CR>')

-- Hover Doc
-- if there has no hover will have a notify no information available
-- to disable it just Lspsaga hover_doc ++quiet
-- press twice it will jump into hover window
keymap('n', '?', '<cmd>Lspsaga hover_doc<CR>')
-- if you want keep hover window in right top you can use ++keep arg
-- notice if you use hover with ++keep you press this keymap it will
-- close the hover window .if you want jump to hover window must use
-- wincmd command <C-w>w
--keymap('n', 'K', '<cmd>Lspsaga hover_doc ++keep<CR>')

-- Callhierarchy
keymap('n', '<Leader>li', '<cmd>Lspsaga incoming_calls<CR>')
keymap('n', '<Leader>lo', '<cmd>Lspsaga outgoing_calls<CR>')

-- Float terminal
keymap({'n', 't'}, '<Leader>lt', '<cmd>Lspsaga term_toggle<CR>')
