return {
  "nvim-lualine/lualine.nvim",
  event = "VimEnter",
  config = function()
    local tab_size = function()
      return (vim.bo.expandtab and "␠" or "␉") .. vim.bo.tabstop
    end

    local function is_available_gps()
      local ok, _ = pcall(require, "nvim-gps")
      if not ok then
        return false
      end
      return require("nvim-gps").is_available()
    end

    local sections_1 = {
      lualine_a = { "mode" },
      lualine_b = { { "filetype", icon_only = true }, { "filename", path = 1 } },
      lualine_c = { { "require('nvim-gps').get_location()", cond = is_available_gps } },
      lualine_x = { "lsp_status", "diagnostics" },
      lualine_y = { "branch", { "diff", symbols = { added = " ", modified = " ", removed = " " } } },
      lualine_z = { "location" },
    }

    local sections_2 = {
      lualine_a = { "mode" },
      lualine_b = { "" },
      lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1 } },
      lualine_x = { tab_size, "encoding", "fileformat", "filetype" },
      lualine_y = { "filesize", "progress" },
      lualine_z = { "location" },
    }

    function LualineToggle()
      local lualine_require = require("lualine_require")
      local modules = lualine_require.lazy_require({ config_module = "lualine.config" })
      local utils = require("lualine.utils.utils")

      local current_config = modules.config_module.get_config()
      if vim.inspect(current_config.sections) == vim.inspect(sections_1) then
        current_config.sections = utils.deepcopy(sections_2)
      else
        current_config.sections = utils.deepcopy(sections_1)
      end
      require("lualine").setup(current_config)
    end

    vim.keymap.set("n", "!", "<Cmd>lua LualineToggle()<CR>", { noremap = true, silent = true })

    local my_extension = {
      sections = { lualine_b = { "filetype" } },
      filetypes = { "packager", "vista", "NvimTree", "neo-tree", "coc-explorer" },
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {
            "dashboard",
            "alpha",
          },
          winbar = {
            "neo-tree",
            "aerial",
            "packer",
            "alpha",
            "dap-repl",
            "dapui_watches",
            "dapui_stacks",
            "dapui_breakpoints",
            "dapui_scopes",
            "dapui_console",
          },
        },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = sections_1,
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "quickfix", my_extension },
    })
  end,
}
