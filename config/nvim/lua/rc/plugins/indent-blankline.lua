require('indent_blankline').setup({
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
    buftype_exclude = {
        'terminal',
    },
    filetype_exclude = {
        'help',
        'dashboard',
        'dashpreview',
        'NvimTree',
        'neo-tree',
        'vista',
        'sagahover',
        'sagasignature',
        'packer',
        'log',
        'lspsagafinder',
        'lspinfo',
        'lsp-installer',
        'dapui_scopes',
        'dapui_breakpoints',
        'dapui_stacks',
        'dapui_watches',
        'dap-repl',
        'toggleterm',
        'alpha',
        'coc-explorer',
    },
})

vim.api.nvim_clear_autocmds({
    event = { 'TextChanged', 'TextChangedI' },
    group = 'IndentBlanklineAutogroup'
})
