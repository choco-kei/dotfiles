return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason-org/mason.nvim", "mfussenegger/nvim-dap" },
  config = function()
    -- ════════════════════════════════════════════════════════════════════
    -- LSP Keymaps Setup
    -- ════════════════════════════════════════════════════════════════════
    local function setup_keymaps(bufnr)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
      end

      -- Hover/Signature
      map("n", "?", function()
        vim.lsp.buf.hover({ border = "rounded", max_height = 25, max_width = 120 })
      end, "Hover")
      map({ "n", "i" }, "<C-/>", vim.lsp.buf.signature_help, "Signature Help")

      -- Diagnostics
      map("n", "gl", vim.diagnostic.open_float, "Line Diagnostic")
      map("n", "[d", function()
        vim.diagnostic.jump({ count = -1 })
      end, "Prev Diagnostic")
      map("n", "]d", function()
        vim.diagnostic.jump({ count = 1 })
      end, "Next Diagnostic")

      -- Inlay Hints
      map("n", "<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
      end, "Toggle Inlay Hints")
    end

    -- ════════════════════════════════════════════════════════════════════
    -- LSP Attach Handler
    -- ════════════════════════════════════════════════════════════════════
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then
          return
        end

        setup_keymaps(bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Inlay hints disabled by default (toggle with <leader>lh)

        -- Document highlight on cursor hold
        if client.server_capabilities.documentHighlightProvider then
          local group = vim.api.nvim_create_augroup("LspDocumentHighlight_" .. bufnr, { clear = true })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = bufnr,
            group = group,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end,
    })

    -- ════════════════════════════════════════════════════════════════════
    -- Diagnostic Configuration
    -- ════════════════════════════════════════════════════════════════════
    vim.diagnostic.config({
      virtual_text = false,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = { border = "rounded", source = true, header = "", prefix = "" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
      },
    })

    -- ════════════════════════════════════════════════════════════════════
    -- LSP Server Configuration
    -- ════════════════════════════════════════════════════════════════════

    -- This is the single source of truth for LSP capabilities.
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- nvim-ufo(folding)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- Set the global capabilities for all LSP servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- lua_ls
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    -- intelephense
    vim.lsp.config("intelephense", {
      settings = {
        intelephense = {
          maxMemory = 256,
          files = {
            maxSize = 1300000,
          },
        },
      },
    })

    -- gopls
    vim.lsp.config("gopls", {
      -- フォーマット機能を無効化(goimportsに任せる)
      on_attach = function(client, _bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        gopls = {
          expandWorkspaceToModule = true,
          analyses = {
            unusedparams = true,
            ST1000 = false,
            ST1020 = false,
            ST1021 = false,
          },
          staticcheck = true,
          completeUnimported = true,
          usePlaceholders = true,
          gofumpt = false,
        },
      },
    })

    -- ts_ls
    vim.lsp.config("ts_ls", {
      filetypes = { "typescript" },
    })

    -- buf_ls
    vim.lsp.config("buf_ls", {
      filetypes = { "proto" },
    })

    -- typos_lsp
    vim.lsp.config("typos_lsp", {
      init_options = {
        config = "~/.config/nvim/spell/typos.toml",
      },
    })
  end,
}
