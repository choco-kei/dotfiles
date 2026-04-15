return {
  "nvim-mini/mini.nvim",
  lazy = false,
  version = false,
  config = function()
    -- mini.align
    require("mini.align").setup()

    -- mini.surround
    require("mini.surround").setup()

    -- mini.ai
    require("mini.ai").setup({
      custom_textobjects = {
        b = {
          { "%b()", "%b[]", "%b{}", '%b""', "%b''", "%b``" },
          "^.().*().$",
        },
      },
    })

    -- mini.cursorword
    require("mini.cursorword").setup({
      delay = 200,
    })

    -- mini.icons
    require("mini.icons").setup()
  end,
}
