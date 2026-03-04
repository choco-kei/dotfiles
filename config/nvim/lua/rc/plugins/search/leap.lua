return {
  url = "https://codeberg.org/andyg/leap.nvim",
  name = "leap.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    local leap = require("leap")

    -- 1. sj: 2文字検索
    vim.keymap.set({ "n", "x", "o" }, "sj", "<Plug>(leap)", {desc = "Leap: 2-char search"})

    -- 2. f/F: 1文字検索
    vim.keymap.set({"n", "x", "o"}, "f", "<Plug>(leap-forward-to)", {desc = "Leap: 1-char search forward"})
    vim.keymap.set({"n", "x", "o"}, "F", "<Plug>(leap-backward-to)", {desc = "Leap: 1-char search backward"})
  end,
}
