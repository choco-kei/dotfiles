local lspsaga = require('lspsaga')
lspsaga.setup({ -- defaults ...
	debug = false,
	use_saga_diagnostic_sign = true,
	-- diagnostic sign
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	diagnostic_header_icon = '   ',
	-- code action title icon
	code_action_keys = { quit = '<C-g>', exec = '<CR>' },
	code_action_icon = ' ',
	code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
	finder_definition_icon = '  ',
	finder_reference_icon = '  ',
	max_preview_lines = 10,
	finder_action_keys = {
		open = '<CR>',
		vsplit = 's',
		split = 'i',
		quit = '<C-g>',
		scroll_down = '<C-f>',
		scroll_up = '<C-b>',
	},
	definition_preview_icon = '  ',
	border_style = 'single',
	rename_action_keys = { quit = '<C-g>', exec = '<CR>' },
	rename_prompt_prefix = '➤',
    rename_output_qflist = {
        enable = true,
        auto_open_qflist = true,
    },
	server_filetype_map = {},
	diagnostic_prefix_format = '%d. ',
})

vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', { silent = true, noremap = true })
--vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'gx', '<cmd>Lspsaga code_action<cr>', { silent = true, noremap = true })
vim.keymap.set('x', 'gx', ':<c-u>Lspsaga range_code_action<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', { silent = true, noremap = true })
vim.keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { silent = true, noremap = true })
vim.keymap.set(
	'n',
	'<C-b>',
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
	{ silent = true, noremap = true }
)
vim.keymap.set(
	'n',
	'<C-f>',
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>",
	{ silent = true, noremap = true }
)

-- リネーム時: <cword>に\を追加(phpのnamespace対応)
vim.keymap.set(
    'n',
    'gr',
    '<cmd>set iskeyword+=\\<cr><cmd>Lspsaga rename<cr>',
    { silent = true, noremap = true }
)
-- リネーム後: <cword>から\をを削除(phpのnamespace対応)
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'LspsagaRename'},
    callback = function()
        vim.api.nvim_create_autocmd('BufLeave', {
            once = true,
            command = 'set iskeyword-=\\',
        })
    end
})
