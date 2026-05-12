return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    win = {
      border = "none",
      --row = -2
    },
    spec = {
      { "<leader>f", group = "File" },
      { "<leader>e", group = "Explorer", icon = "" },
      { "<leader>g", group = "Git", icon = { cat = "filetype", name = "git", color = "orange" } },
      { "<leader>gh", group = "Hunk", icon = " " },
      { "<leader>s", group = "Search" },
      { "<leader>b", group = "Buffer" },
      { "<leader>l", group = "LSP", icon = "" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>n", group = "Notification" },
      { "<leader>u", group = "UI" },
      { "a", group = "Outer", icon = "󰆧 ", mode = { "x", "o" } },
      { "i", group = "Inner", icon = "󰆧 ", mode = { "x", "o" } },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
