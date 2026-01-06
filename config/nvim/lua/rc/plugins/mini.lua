return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    -- mini.align
    require('mini.align').setup()

    -- mini.surround
    require('mini.surround').setup()
  end,
}
