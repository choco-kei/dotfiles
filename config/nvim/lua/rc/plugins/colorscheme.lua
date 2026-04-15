local selected = "catppuccin"

return {
  {
    "EdenEast/nightfox.nvim",
    enabled = selected == "nightfox",
    lazy = false,
    config = function()
      local palettes = {
        nordfox = {
          -- A palette also defines the following:
          --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
          --
          -- These are the different foreground and background shades used by the theme.
          -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
          -- incrementally lighter versions.
          --bg1 = '#161821',
          --bg1 = '#222533',
        },
      }

      require("nightfox").setup({
        options = {
          -- Compiled file's destination location
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled", -- Compiled file suffix
          transparent = false,               -- Disable setting background
          terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
          dim_inactive = false,              -- Non focused panes set to alternative background
          module_default = true,             -- Default enable value for modules
          colorblind = {
            enable = false,                -- Enable colorblind support
            simulate_only = false,         -- Only show simulated colorblind colors and not diff shifted
            severity = {
              protan = 0,                -- Severity [0,1] for protan (red)
              deutan = 0,                -- Severity [0,1] for deutan (green)
              tritan = 0,                -- Severity [0,1] for tritan (blue)
            },
          },
          styles = {             -- Style to be applied to different syntax groups
            comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
          },
          modules = { -- List of various plugins and additional options
            dapui = false,
          },
        },
        palettes = palettes,
        specs = {},
        groups = {
          all = {
            -- snacks.nvim:borderless
            SnacksPicker              = { fg = nil, bg = "bg0" },
            SnacksPickerTitle         = { fg = "palette.blue", bg = "bg0" },
            SnacksPickerBorder        = { fg = "bg0", bg = "bg0" },
            SnacksPickerInput         = { fg = nil, bg = "bg2" },
            SnacksPickerInputTitle    = { fg = "bg2", bg = "palette.blue" },
            SnacksPickerInputBorder   = { fg = "bg2", bg = "bg2" },
            SnacksPickerPreview       = { fg = nil, bg = "bg0" },
            SnacksPickerPreviewBorder = { fg = "bg0", bg = "bg0" },

            -- telescope.nvim:borderless
            TelescopePromptBorder = { fg = nil, bg = "bg2" },
            TelescopePromptNormal = { fg = "palette.blue", bg = "bg2" },
            TelescopePromptPrefix = { fg = "palette.blue", bg = "bg2" },
            TelescopePreviewTitle = { fg = "palette.blue", bg = "bg0" },
            TelescopeBorder       = { fg = "palette.blue", bg = "bg0" },
            TelescopeNormal       = { fg = nil, bg = "bg0" },
            TelescopeTitle        = { fg = "palette.blue", bg = "bg2" },
          }
        },
      })

      -- カラースキーム設定
      vim.cmd([[ colorscheme nordfox ]])
    end,
  },
  {
    "neanias/everforest-nvim",
    enabled = selected == "everforest",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        background = "hard",
        disable_italic_comments = true,
        -- 色変更
        colours_override = function(c)
          -- bg0をbg_dimに置き換え(ghosttyと同じ色に)
          c.bg0 = c.bg_dim
        end,
        -- ハイライト定義
        on_highlights = function(hl, c)
          -- DiagnosticUnderline
          hl.DiagnosticUnderlineError = { fg = "NONE", undercurl = true, sp = c.red }
          hl.DiagnosticUnderlineWarn  = { fg = "NONE", undercurl = true, sp = c.yellow }
          hl.DiagnosticUnderlineInfo  = { fg = "NONE", undercurl = true, sp = c.blue }
          hl.DiagnosticUnderlineHint  = { fg = "NONE", undercurl = true, sp = c.purple }
          -- CurrentWord
          hl.CurrentWord = { bg = c.bg1 }
          -- search
          hl.CurSearch = { fg = c.bg0, bg = c.green }
          hl.IncSearch = { bg = c.bg4 }
          hl.Search    = { link = "IncSearch" }

          -- indent-blankline.nvim:色を薄く調整
          hl.IblIndent = { fg = c.bg1 }
          -- snacks.nvim:borderless
          hl.SnacksPicker              = { fg = nil, bg = c.bg0 }
          hl.SnacksPickerTitle         = { fg = c.blue, bg = c.bg0 }
          hl.SnacksPickerBorder        = { fg = c.bg0, bg = c.bg0 }
          hl.SnacksPickerInput         = { fg = nil, bg = c.bg2 }
          hl.SnacksPickerInputTitle    = { fg = c.bg2, bg = c.blue }
          hl.SnacksPickerInputBorder   = { fg = c.bg2, bg = c.bg2 }
          hl.SnacksPickerPreview       = { fg = nil, bg = c.bg0 }
          hl.SnacksPickerPreviewBorder = { fg = c.bg0, bg = c.bg0 }
          -- modes.nvim:add
          hl.ModesDefaultCursor = { bg = c.orange, reverse = false }
          hl.ModesCopy          = { bg = c.yellow }
          hl.ModesDelete        = { bg = c.red }
          hl.ModesChange        = { bg = c.red }
          hl.ModesFormat        = { bg = c.orange }
          hl.ModesInsert        = { bg = c.blue }
          hl.ModesReplace       = { bg = c.aqua }
          hl.ModesSelect        = { bg = c.purple }
          hl.ModesVisual        = { bg = c.purple }
        end,
      })

      -- カラースキーム設定
      vim.cmd([[ colorscheme everforest ]])
    end,
  },
  {
    "catppuccin/nvim",
    enabled = selected == "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "frappe",
        },
        no_italic = true, -- Force no italic
        default_integrations = true,
        auto_integrations = false,
        integrations = {
          diffview = true,
          fidget = true,
          mason = true,
          dap = true,
          dap_ui = true,
          ufo = true,
          yanky = true,
          todo_comments = true,
          dropbar = {
            enabled = true,
            color_mode = true,
          },
          --cmp = true,
          --gitsigns = true,
          --nvimtree = true,
          --notify = false,
          -- mini = {
          --   enabled = true,
          --   indentscope_color = "",
          -- },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
        color_overrides = {
          -- mocha = {
          --   text = "#e0e6f9",
          -- },
          -- macchiato = {
          --   text = "#dee4f9",
          -- },
          -- frappe = {
          --   text = "#dbe2f9",
          -- },
        },
        highlight_overrides = {
          all = function(c)
            return {
              -- nvim
              -- 影響範囲注意
              FloatBorder = { fg = c.mantle, bg = c.mantle },
              -- mini.cursorword
              MiniCursorword        = { style = {}, bg = c.surface0, },
              MiniCursorwordCurrent = { style = {}, bg = c.surface0, },
              -- snacks.nvim:borderless
              SnacksPicker              = { fg = nil, bg = c.base },
              SnacksPickerPrompt        = { bg = c.surface0, fg = c.blue },
              SnacksPickerTitle         = { fg = c.blue, bg = c.base },
              SnacksPickerBorder        = { fg = c.teal, bg = c.base },
              SnacksPickerBoxBorder        = { fg = c.surface0, bg = c.surface0 },
              SnacksPickerInput         = { fg = nil, bg = c.surface0 },
              SnacksPickerInputTitle    = { fg = c.surface0, bg = c.blue },
              SnacksPickerInputBorder   = { fg = c.surface0, bg = c.surface0 },
              SnacksPickerList            = { bg = c.base }, -- リスト:リスト
              SnacksPickerListBorder      = { fg = c.base, bg = c.base }, -- リスト:外枠
              SnacksPickerListCursorLine  = { bg = c.surface1 }, -- リスト:カーソル
              SnacksPickerListTitle  = { fg = c.blue, bg = c.base },
              SnacksPickerPreview       = { fg = nil, bg = c.base },
              SnacksPickerPreviewBorder = { fg = c.base, bg = c.base },
              SnacksPickerToggle        = { fg = c.surface0, bg = c.blue },
              SnacksInputBorder        = { fg = c.surface0, bg = c.surface0 },
              SnacksInputNormal        = { bg = c.surface0 },
              SnacksInputTitle        = { fg = c.base, bg = c.teal },
              -- witch-key.nvim:borderless
              -- WhichKeyBorder = { fg = c.mantle, bg = c.mantle },
              -- WhichKeyTitle = { fg = c.mantle, bg = c.green},
              -- tiny-cmdline.nvim
              TinyCmdlineNormal = { bg = c.surface0 },
              TinyCmdlineBorder = { fg = c.surface0, bg = c.surface0 },
              -- modes.nvim:add
              ModesCopy    = { bg = c.blue },
              ModesDelete  = { bg = c.red },
              ModesChange  = { bg = c.red },
              ModesFormat  = { bg = c.peach },
              ModesInsert  = { bg = c.green },
              ModesReplace = { bg = c.teal },
              ModesSelect  = { bg = c.mauve },
              ModesVisual  = { bg = c.mauve },
            }
          end,
        },
      })

      -- カラースキーム設定
      vim.cmd([[ colorscheme catppuccin ]])
    end,
  },
}
