return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  -- Lazy-load on these keypresses
  keys = {
    { "af", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer function" },
    { "if", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner function" },
    { "ac", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer class" },
    { "ic", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner class" },
    { "aB", function() require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer block" },
    { "iB", function() require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner block" },
    { "ai", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer conditional" },
    { "ii", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner conditional" },
    { "al", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer loop" },
    { "il", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner loop" },
    { "ap", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects") end, mode = { "x", "o" }, desc = "Outer parameter" },
    { "ip", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects") end, mode = { "x", "o" }, desc = "Inner parameter" },
    
    -- Repeaters
    { ";", function() require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next() end, mode = { "n", "x", "o" }, desc = "Repeat next textobject move" },
    { ",", function() require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous() end, mode = { "n", "x", "o" }, desc = "Repeat previous textobject move" },
  },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        enable = true,
        lookahead = true,
      },
      move = {
        enable = true,
        set_jumps = true,
      },
    })

    -- These keymaps use `expr = true` and are better set with `vim.keymap.set`
    local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"
    vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
    vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
  end,
}
