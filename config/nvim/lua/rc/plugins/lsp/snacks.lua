return {
  "folke/snacks.nvim",
  -- enabled = false,
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      enabled = true,
      prompt = "   ",
      wo = {
        number = true,
        relativenumber = false,
        signcolumn = "no"
      },
      layout = "borderless",
      layouts = {
        borderless = {
          layout = {
            box = 'horizontal',
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = 'none',
            {
              box = 'vertical',
              { win = 'input', height = 1, border = 'rounded', title = '{title} {live} {flags}', title_pos = 'center' },
              { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
            },
            {
              win = 'preview',
              title = '{preview:Preview}',
              width = 0.5,
              border = 'rounded',
              title_pos = 'center',
            },
          },
        }
      },
    },
    input = {
      enabled = true,
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    },
    rename = { enabled = true },
  },

  keys = {
    -- ドキュメントシンボル
    { "g0", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols (Snacks)" },
    -- ワークスペースシンボル
    { "gW", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols (Snacks)" },
    { "gr", function() vim.lsp.buf.rename() end, desc = "LSP Rename (Snacks)" },
  },

  config = function(_, opts)
    require("snacks").setup(opts)
  end,
}
