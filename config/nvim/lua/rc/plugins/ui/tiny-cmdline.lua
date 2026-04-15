return {
  "rachartier/tiny-cmdline.nvim",
  event = "VimEnter",
  config = function()
    vim.o.cmdheight = 0
    require("tiny-cmdline").setup({
      position = {
        x = "50%",
        y = "80%",
      },
      native_types = {},
    })
  end,
}
