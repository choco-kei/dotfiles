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
      { "<leader>e", group = "Explorer", icon =""},
      { "<leader>s", group = "Search" },
      { "<leader>b", group = "Buffer" },
      { "<leader>l", group = "LSP", icon ="" },
      { "<leader>d", group = "Diagnostics" },
      { "<leader>n", group = "Notification" },
      { "<leader>u", group = "UI" },
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
