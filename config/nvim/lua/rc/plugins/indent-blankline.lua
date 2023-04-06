require('indent_blankline').setup({
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter = true,
})

--vim.api.nvim_clear_autocmds({
--    event = { 'TextChanged', 'TextChangedI' },
--    group = 'IndentBlanklineAutogroup'
--})
