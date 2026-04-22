return {
  "gbprod/yanky.nvim",
  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put text after" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put text before" },
    { "<C-n>", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
    { "<C-p>", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
  },
  opts = {},
}
