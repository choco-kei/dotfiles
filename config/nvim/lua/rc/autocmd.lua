vim.api.nvim_exec(
    [[
    autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=phtml | set ft=blade
    ]],
    true
)
