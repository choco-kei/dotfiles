-- minimal_init.lua

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require("lazy").setup({
  -- LSP server installer
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- LSP configuration framework
  "neovim/nvim-lspconfig",

  -- Treesitter for syntax parsing
  "nvim-treesitter/nvim-treesitter",

  -- Navigator and its dependencies
  {
    "ray-x/navigator.lua",
    dependencies = { "ray-x/guihua.lua", "nvim-lspconfig" },
    config = function()
      -- This is the configuration block from your setup
      require("navigator").setup({
        debug = true, -- Enable debug logging for navigator
        default_mapping = false,
        keymaps = {
          { key = "gp", func = require("navigator.definition").definition_preview, desc = "definition_preview" },
          -- Add any other essential keymaps for testing if needed
        },
        lsp = {
          disable_lsp = "all", -- Use our own lspconfig setup
          diagnostic = {
            enable = true,
            virtual_text = false,
          },
        },
      })
    end,
  },
})

-- [[ LSP Setup ]]
local on_attach = function(client, bufnr)
  -- Setup keymaps only for the test buffer
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end

-- Configure mason to ensure servers are installed
require("mason").setup()
require("mason-lspconfig").setup({
  -- Ensure the PHP language server is installed
  ensure_installed = { "intelephense" },
})

-- Setup LSP servers
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities() -- Use default capabilities

lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
