return {
  "folke/snacks.nvim",
  -- enabled = false,
  priority = 1000,
  lazy = false,
  opts = {
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
    { "gr", function() vim.lsp.buf.rename() end, desc = "LSP Rename (Snacks)" },
  },
}
