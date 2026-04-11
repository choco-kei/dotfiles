return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {
      char     = "│",
      -- tab_char = "╽",
      -- tab_char = "┼",
      tab_char = "├",
      highlight = "IBLIndent",
    },
    scope = {
      enabled = true,
      -- 警告のアンダーラインなどを優先
      priority = 1,
      -- スコープの色リスト
      highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
      },
      show_start = true,
      show_end = false,
    },
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")

    vim.g.rainbow_delimiters = { highlight = opts.scope.highlight }

    hooks.register(
      hooks.type.SCOPE_HIGHLIGHT,
      hooks.builtin.scope_highlight_from_extmark
    )

    require("ibl").setup(opts)
  end,
}
