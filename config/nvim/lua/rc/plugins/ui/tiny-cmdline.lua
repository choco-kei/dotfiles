return {
  "rachartier/tiny-cmdline.nvim",
  event = "VimEnter",
  config = function()
    vim.o.cmdheight = 0
    require("tiny-cmdline").setup({
      position = {
        x = "50%",
        y = "70%",
      },
      native_types = {},
    })
  end,
}
