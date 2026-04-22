return {
  url = "https://codeberg.org/andyg/leap.nvim",
  name = "leap.nvim",
  event = "VeryLazy",
  config = function()
    local leap = require("leap")

    leap.opts.preview = false
    local hl = vim.api.nvim_get_hl(0, { name = "DiagnosticVirtualTextHint", link = false })
    vim.api.nvim_set_hl(
      0,
      "LeapLabel",
      vim.tbl_extend("force", hl, {
        underline = true,
      })
    )
    leap.init_hl()

    -- ラベルをキーの位置に表示
    leap.opts.on_beacons = function(targets, _, _)
      for _, t in ipairs(targets) do
        if t.label and t.beacon then
          t.beacon[1] = 0
        end
      end
    end

    -- 1. gj: 2文字検索
    vim.keymap.set({ "n", "x", "o" }, "gj", function()
      leap.leap({
        target_windows = { vim.api.nvim_get_current_win() },
        opts = { safe_labels = "" },
      })
    end, { desc = "Leap: 2-char search" })

    -- 2. f/F: 1文字検索 (READMEのenhanced f/F)
    local function ft(key_specific_args)
      leap.leap(vim.tbl_deep_extend("keep", key_specific_args or {}, {
        inputlen = 1,
        inclusive = true,
        opts = {
          safe_labels = "",
        },
      }))
    end

    vim.keymap.set({ "n", "x", "o" }, "f", function()
      ft()
    end, { desc = "Leap: 1-char search forward" })
    vim.keymap.set({ "n", "x", "o" }, "F", function()
      ft({ backward = true })
    end, { desc = "Leap: 1-char search backward" })

    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
  end,
}
