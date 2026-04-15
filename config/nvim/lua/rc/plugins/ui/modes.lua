return {
  "mvllow/modes.nvim",
  event = "VimEnter",
  config = function()
    require("modes").setup({
      -- Set opacity for cursorline and number background
      line_opacity = 0.15,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      set_number = true,

      -- Disable modes highlights in specified filetypes
      -- Please PR commonly ignored filetypes
      ignore = {
        "NvimTree",
        "!neo-tree",
        "!neo-tree-popup",
        "neo-tree-preview",
        "TelescopePrompt",
        "snacks_picker_input",
      },
    })
  end,
}
