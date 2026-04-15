return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  config = function()
    require("dropbar").setup({
      icons = {
        ui = {
          bar = { separator = "  ", extends = "…" },
        }
      },
    })
  end,
}
