return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  event = "VimEnter",
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup({
      animation = false,

      -- both true: after current
      insert_at_end = false,
      insert_at_start = false,

      -- padding
      maximum_padding = 2,
      minimum_padding = 2,

      hide = { extensions = false },

      tabpages = false,

      icons = {
        -- tab nummber
        buffer_index = "superscript",
        buffer_number = false,

        -- close button
        button = false,
        current = { button = '' },

        modified = { button = "●" },

        pinned = { button = "", filename = true },

        separator = { left = "▎", right = "" },
        separator_at_end = true,

        filetype = { enabled = true },
        scroll = { left = '', right = '', },
      },

      -- sidebar offset
      -- sidebar_filetypes = {
      --   NvimTree = true,
      --   ["neo-tree"] = { event = "BufWipeout" },
      --   ["snacks_layout_box"] = { event = "BufWipeout" },
      -- },
    })

    -- keymap
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- tab操作
    map("n", "tn", ":tabnew<CR>", opts) -- 新規タブ
    map("n", "th", "<Cmd>BufferPrevious<CR>", opts) -- 前のバッファ
    map("n", "tl", "<Cmd>BufferNext<CR>", opts)     -- 次のバッファ
    map("n", "tj", "<Cmd>BufferMovePrevious<CR>", opts) -- バッファを左へ
    map("n", "tk", "<Cmd>BufferMoveNext<CR>", opts)     -- バッファを右へ
    map("n", "tp", "<Cmd>BufferPick<CR>", opts)         -- ピック

    -- pinned
    map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts) -- Alt+p でピン留め切替

    -- バッファ番号指定（BufferGoto）
    map("n", "t1", "<Cmd>BufferGoto 1<CR>", opts)
    map("n", "t2", "<Cmd>BufferGoto 2<CR>", opts)
    map("n", "t3", "<Cmd>BufferGoto 3<CR>", opts)
    map("n", "t4", "<Cmd>BufferGoto 4<CR>", opts)
    map("n", "t5", "<Cmd>BufferGoto 5<CR>", opts)
    map("n", "t6", "<Cmd>BufferGoto 6<CR>", opts)
    map("n", "t7", "<Cmd>BufferGoto 7<CR>", opts)
    map("n", "t8", "<Cmd>BufferGoto 8<CR>", opts)
    map("n", "t9", "<Cmd>BufferGoto 9<CR>", opts)
  end,
}
