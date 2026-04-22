return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      untracked = { text = "┆" },
    },
    signs_staged = {
      untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      -- Navigation
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")
    end,
  },
  -- stylua: ignore
  keys = {
    -- Hunk operations under <leader>gh (git hunk)
    { "<leader>ghp", function() require("gitsigns").preview_hunk() end, desc = "Preview Hunk" },
    { "<leader>ghP", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview Hunk Inline" },
    { "<leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage Hunk" },
    { "<leader>ghu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo Stage Hunk" },
    { "<leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset Hunk" },
    -- Buffer operations
    { "<leader>gS", function() require("gitsigns").stage_buffer() end, desc = "Stage Buffer" },
    -- Blame
    { "<leader>gb", function() require("gitsigns").blame_line() end, desc = "Blame Line" },
    { "<leader>gB", function() require("gitsigns").blame() end, desc = "Blame Buffer" },
    -- Diff
    { "<leader>gD", function() vim.cmd("Gitsigns diffthis HEAD") end, desc = "Diff HEAD" },
  },
}
