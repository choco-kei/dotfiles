return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = { enabled = false },

      char = {
        enabled = true,
        jump_labels = true,
        multi_line = false,
        -- ";, は使わない" の方針なので、f,F のみ残す
        keys = { "f", "F" },
      },
    },
  },
  config = function(_, opts)
    require("flash").setup(opts)
    vim.api.nvim_set_hl(0, "FlashLabel", { link = "IncSearch" })
  end,
  keys = {
    { "sj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" }, -- s -> sj surround系互換
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  },
}
