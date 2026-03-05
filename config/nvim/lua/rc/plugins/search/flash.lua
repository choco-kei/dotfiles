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

    -- DiagnosticVirtualTextWarn の色情報を取得して、underline を加えて再定義する
    local hl = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextWarn", link = false })
    vim.api.nvim_set_hl(0, "FlashLabel", vim.tbl_extend("force", hl, {
      underline = true,
    }))
  end,
  keys = {
    { "sj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" }, -- s -> sj surround系互換
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  },
}
