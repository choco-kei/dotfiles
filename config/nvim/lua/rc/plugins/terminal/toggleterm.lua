return {
  "akinsho/toggleterm.nvim",
  enabled = false,
  keys = { "<C-_>" },
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-_>]],
      direction = "horizontal",
      -- ターミナルが開かれた時に実行する処理を追加
      on_open = function(term)
        vim.opt_local.signcolumn = "no"
        vim.opt_local.statuscolumn = ""
        vim.opt_local.foldcolumn = "0"

        -- ターミナルモードで <C-o> を <C-\><C-n> にマッピングする
        -- この設定は、このターミナルバッファ内でのみ有効になります
        vim.keymap.set('t', '<C-o>', [[<C-\><C-n>]], {
          noremap = true,
          silent = true,
          buffer = term.bufnr,
        })
        vim.api.nvim_command("startinsert")
        vim.api.nvim_command("checktime")
      end,
    })
  end,
}
