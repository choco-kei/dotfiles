return {
  "JoosepAlviste/nvim-ts-context-commentstring",
  event = "VimEnter",
  config = function()
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
      config = {
        php = '// %s',
      },
    }
  end,
}
