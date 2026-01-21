return {
  url = "https://codeberg.org/andyg/leap.nvim",
  name = "leap.nvim",
  event = "VeryLazy",
  config = function()
    local leap = require("leap")

    -- 1. sj: 2文字検索
    vim.keymap.set({ "n", "x", "o" }, "sj", "<Plug>(leap)", {desc = "Leap: 2-char search"})

    -- 2. f/F: 1文字検索
    do
      local function leap_one_char(backward)
        require("leap").leap({
          inputlen = 1,
          inclusive = true,
          backward = backward,
          target_windows = { vim.api.nvim_get_current_win() }, -- 現在のウィンドウのみを対象
        })
      end

      vim.keymap.set({"n", "x", "o"}, "f", function() leap_one_char(false) end, {desc = "Leap: 1-char search forward"})
      vim.keymap.set({"n", "x", "o"}, "F", function() leap_one_char(true) end, {desc = "Leap: 1-char search backward"})
    end
  end,
}
