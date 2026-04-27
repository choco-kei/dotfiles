local group = vim.api.nvim_create_augroup("rc_formatoptions", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})
