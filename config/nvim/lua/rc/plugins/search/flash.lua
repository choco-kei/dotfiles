return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = { enabled = true },

      char = {
        enabled = true,
        jump_labels = true,
        -- ";, は使わない" の方針なので、f,F のみ残す
        keys = { "f", "F" },
      },
    },
  },
  keys = {
    { "sj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" }, -- s -> sj surround系互換
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  },
}
