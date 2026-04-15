-- TODO: 新しい実装のものを探す

return {
  "t9md/vim-quickhl",
  event = "VeryLazy",
  config = function()
    vim.keymap.set("n", "<Space>m", "<Plug>(quickhl-manual-this)", { noremap = true, silent = true })
    vim.keymap.set("x", "<Space>m", "<Plug>(quickhl-manual-this)", { noremap = true, silent = true })
    vim.keymap.set("n", "<Space>M", "<Plug>(quickhl-manual-reset)", { noremap = true, silent = true })
    vim.keymap.set("x", "<Space>M", "<Plug>(quickhl-manual-reset)", { noremap = true, silent = true })
    vim.keymap.set("n", "<Space>j", "<Plug>(quickhl-cword-toggle)", { noremap = true, silent = true })
  end,
}
