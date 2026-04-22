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

    -- mini.pairs
    require("mini.pairs").setup()

    -- mini.hipatterns
    -- require("mini.hipatterns").setup({
    --   highlighters = {
    --     hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
    --   },
    -- })

    -- mini.operators
    require("mini.operators").setup({
      replace = { prefix = "R", reindent_linewise = true }, -- 置換
      evaluate = { prefix = "" }, -- 数式評価
      exchange = { prefix = "" }, -- 入れ替え
      multiply = { prefix = "" }, -- 複製
      sort = { prefix = "" }, -- ソート
    })
  end,
}
