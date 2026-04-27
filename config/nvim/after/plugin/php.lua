local group = vim.api.nvim_create_augroup("rc_php_after_plugin", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "php",
  callback = function()
    vim.bo.autoindent = true
    vim.bo.indentexpr = "GetPhpIndent()"
    vim.opt_local.formatoptions:append("r")
  end,
})
