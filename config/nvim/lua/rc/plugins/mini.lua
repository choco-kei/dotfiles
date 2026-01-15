return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    -- mini.align
    require('mini.align').setup()

    -- mini.surround
    require('mini.surround').setup()

    -- mini.ai
    require('mini.ai').setup({
      custom_textobjects = {
        b = {
          { '%b()', '%b[]', '%b{}', '%b""', "%b''", '%b``' },
          '^.().*().$'
        },
      },
    })
  end,
}
