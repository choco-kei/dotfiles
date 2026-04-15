return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = ":TSUpdate",
  config = function()
    require('ts_context_commentstring').setup {
      enable_autocmd = false,
      config = {
        php = '// %s',
      },
    }
    -- Neovim 0.10+ の標準コメント機能との連携
    -- table.insert を使わず、get_option をフックするこの方法が最も安全です
    if vim.fn.has('nvim-0.10') == 1 then
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function()
          vim.bo.commentstring = require('ts_context_commentstring.internal').calculate_commentstring() or vim.bo.commentstring
        end,
      })
      -- もしこれでもダメな場合、Neovim 0.10/0.11 本体の get_option を直接上書きします
      vim.g.skip_ts_context_commentstring_module = true
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.filetype.get_option = function(filetype, option)
        if option == "commentstring" then
          return require("ts_context_commentstring.internal").calculate_commentstring()
        end
        return vim.filetype.get_option(filetype, option)
      end
    end

    require("nvim-treesitter").setup({
      install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site/treesitter"),
    })

    local langs = {
      "go", "gomod", "proto",
      "php", "php_only", "phpdoc",
      "dockerfile",
      "yaml", "toml",
      "lua", "vim", "vimdoc",
    }

    local ignore_indent = { "proto" }

    require("nvim-treesitter").install(langs)

    local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = langs,
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
      end
    })
  end,
}
