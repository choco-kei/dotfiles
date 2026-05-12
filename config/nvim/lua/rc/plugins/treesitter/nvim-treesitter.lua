return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = ":TSUpdate",
  config = function()
    vim.g.skip_ts_context_commentstring_module = true

    local ts_context_commentstring = require("ts_context_commentstring")
    ts_context_commentstring.setup({
      enable_autocmd = false,
    })

    if vim.fn.has("nvim-0.10") == 1 then
      local get_option = vim.filetype.get_option

      ---@diagnostic disable-next-line: duplicate-set-field
      vim.filetype.get_option = function(filetype, option)
        if option == "commentstring" and filetype ~= "php" then
          return ts_context_commentstring.calculate_commentstring() or get_option(filetype, option)
        end

        return get_option(filetype, option)
      end
    end

    require("nvim-treesitter").setup({
      install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site/treesitter"),
    })

    local ensure_installed = {
      "go",
      "gomod",
      "proto",
      "php",
      "php_only",
      "phpdoc",
      "dockerfile",
      "markdown",
      "markdown_inline",
      "yaml",
      "toml",
      "lua",
      "vim",
      "vimdoc",
    }

    local ignore_indent = { "proto" }

    require("nvim-treesitter").install(ensure_installed)

    local group = vim.api.nvim_create_augroup("TreesitterSetup", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = ensure_installed,
      callback = function(args)
        -- ハイライトを有効
        vim.treesitter.start(args.buf)

        -- インデントを有効
        local lang = vim.bo[args.buf].filetype

        -- ignore_indent に現在の言語が含まれているかチェック
        if vim.list_contains(ignore_indent, lang) then
          vim.bo[args.buf].indentexpr = ""
        else
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
