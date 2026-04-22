return {
  "rachartier/tiny-cmdline.nvim",
  event = "VimEnter",
  init = function()
    vim.o.cmdheight = 0
  end,
  opts = {
    position = {
      x = "50%",
      y = "70%",
    },
    native_types = {},
  },
}
