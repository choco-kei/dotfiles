return {
  "akinsho/bufferline.nvim",
  event = "VimEnter",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to 'tabs' to only show tabpages instead
        numbers = function(opts)
          return string.format("%s", opts.raise(opts.ordinal))
        end,
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a 'name', 'path' and 'bufnr'
          -- remove extension from markdown files for example
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        indicator = {
          icon = "▎",
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",

        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = true,

        --sort_by = 'insert_after_current',
        sort_by = "insert_at_end",
        --separator_style = 'thick'
        offsets = {
          -- {
          --     filetype = "NvimTree",
          --     text = function()
          --         return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
          --     end,
          --     highlight = "Directory",
          --     text_align = "left",
          -- },
          -- {
          --     filetype = "neo-tree",
          --     --text = function()
          --     --    return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
          --     --end,
          --     text = "neo-tree",
          --     highlight = "Directory",
          --     text_align = "left",
          -- },
        },
      },
      -- highlights = {
      --     fill = {
      --         bg = "#232831",
      --     },
      --     --indicator_selected = {
      --     --    fg = '#87a0be',
      --     --},
      -- },
    })

    -- タブ操作
    vim.keymap.set("n", "tn", ":tabnew<CR>", { noremap = true, silent = true }) -- tn 新規タブ
    -- bufdel(snacks側に移動)
    --vim.keymap.set("n", "[tab]q", ":bd<CR>", { remap = true, silent = true }) -- tn タブ閉じ(バッファー閉じ)

    -- bufferline
    vim.keymap.set("n", "tp", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "th", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true }) -- th 前のタブ
    vim.keymap.set("n", "tl", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true }) -- tl 次のタブ
    vim.keymap.set("n", "tj", "<Cmd>BufferLineMovePrev<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "tk", "<Cmd>BufferLineMoveNext<CR>", { noremap = true, silent = true })

    -- タブ番号指定
    vim.keymap.set("n", "t1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "t9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
  end,
}
