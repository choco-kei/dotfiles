local null_ls = require("null-ls")

local sources = {
    -- php diagnostics
    null_ls.builtins.diagnostics.php,

    -- php formatter
    null_ls.builtins.formatting.phpcbf.with({ extra_args = { "--standard=PSR1,PSR12" } }),

    -- js diagnostics
    --null_ls.builtins.diagnostics.eslint_d,
    -- js formatter
    --null_ls.builtins.formatting.eslint_d,

    -- lua formatter
    null_ls.builtins.formatting.stylua,

    -- null_ls.builtins.completion.spell,
    --null_ls.builtins.formatting.stylua,
    --null_ls.builtins.formatting.black,
    -- rust-analyzer
    -- null_ls.builtins.formatting.rustfmt,
    --null_ls.builtins.formatting.prettier,
    --null_ls.builtins.diagnostics.eslint,
    --null_ls.builtins.formatting.shfmt,
    --null_ls.builtins.diagnostics.shellcheck,
    --null_ls.builtins.diagnostics.codespell,
    --null_ls.builtins.formatting.markdownlint,
    --null_ls.builtins.code_actions.gitsigns,
    -- LuaFormatter on
}

-- phpcs diagnostics
if NULL_LS_PHPCS_ENABLED ~= false then
    print(NULL_LS_PHPCS_ENABLED)
    table.insert(
        sources,
        null_ls.builtins.diagnostics.phpcs.with({
            extra_args = NULL_LS_PHPCS_ARGS and NULL_LS_PHPCS_ARGS
                or { "--standard=PSR1,PSR12", "--ignore=*\\.blade\\.php" },
        })
    )
end

null_ls.setup({
    sources = sources,
    --on_attach = function(client)
    --  if client.resolved_capabilities.document_formatting then
    --      vim.cmd([[
    --      augroup LspFormatting
    --          autocmd! * <buffer>
    --          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    --      augroup END
    --      ]])
    --  end
    --end,
})
