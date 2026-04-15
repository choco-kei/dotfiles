return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<Space>f",
      function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      -- Lua
      lua = { "stylua" },

      -- Go
      go = { "goimports", "gofmt" },

      -- PHP
      php = { "pint", "php_cs_fixer", stop_after_first = true },

      -- Vim Script
      vim = { "indent" },

      -- all
      --["*"] = { "trim_whitespace" },
    },

    formatters = {
      php_cs_fixer = {
        args = { "fix", "$FILENAME", "--config=.php-cs-fixer.dist.php" },
      },
    },

    -- on save
    format_on_save = function(bufnr)
      -- phpは保存時にフォーマットしない
      if vim.bo[bufnr].filetype == "php" then
        return
      end

      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,
  },
}
