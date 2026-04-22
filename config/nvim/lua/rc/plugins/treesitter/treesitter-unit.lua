return {
  "David-Kunz/treesitter-unit",
  -- キーを叩いた瞬間にロードする
  keys = {
    { "iu", mode = { "x", "o" }, desc = "Select inner treesitter unit" },
    { "au", mode = { "x", "o" }, desc = "Select outer treesitter unit" },
  },
  config = function()
    -- ロードされた後に、実際のキー挙動を割り当てる
    vim.keymap.set("x", "iu", '<cmd>lua require"treesitter-unit".select()<CR>', { noremap = true })
    vim.keymap.set("x", "au", '<cmd>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
    vim.keymap.set("o", "iu", '<cmd>lua require"treesitter-unit".select()<CR>', { noremap = true })
    vim.keymap.set("o", "au", '<cmd>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
  end,
}
