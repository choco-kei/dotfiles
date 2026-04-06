return {
  {
    "ray-x/go.nvim",
    enabled = false,
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    config = function()
      require("go").setup({
        lsp_cfg = true,
        lsp_gopls = true,
        lsp_keymaps = false,

        lsp_inlay_hints = {
          enable = false,
        },

        lsp_on_attach = false,

        gofmt = nil,
        goimport = nil,
      })
    end,
  },
  {
    "edolphin-ydf/goimpl.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    config = function()
      require("telescope").load_extension("goimpl")
    end,
    keys = {
      { "<leader>im", "<CMD>Telescope goimpl<CR>", desc = "Go Implement" },
    },
  }
}
