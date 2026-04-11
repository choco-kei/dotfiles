return {
  "EdenEast/nightfox.nvim",
  --event = "VimEnter",
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
      groups = {},
    })

    vim.cmd([[ colorscheme nordfox ]])


    -- カラー調整
    local hl = {}
    local c = require("nightfox.palette").load("nordfox")

    -- snacks.nvim:borderless
    local bg_float1 = c.bg2
    local bg_float2 = c.bg0
    local accent = c.blue.base
    hl.SnacksPicker = { fg = nil, bg = bg_float2 }
    hl.SnacksPickerTitle = { fg = accent, bg = bg_float2 }
    hl.SnacksPickerBorder = { fg = bg_float2, bg = bg_float2 }
    hl.SnacksPickerInput = { fg = nil, bg = bg_float1 }
    hl.SnacksPickerInputTitle = { fg = bg_float1, bg = accent }
    hl.SnacksPickerInputBorder = { fg = bg_float1, bg = bg_float1 }
    hl.SnacksPickerPreview = { fg = nil, bg = bg_float2 }
    hl.SnacksPickerPreviewBorder = { fg = bg_float2, bg = bg_float2 }

    -- telescope.nvim:borderless
    hl.TelescopePromptBorder = { fg = nil, bg = bg_float1 }
    hl.TelescopePromptNormal = { fg = accent, bg = bg_float1 }
    hl.TelescopePromptPrefix = { fg = accent, bg = bg_float1 }
    hl.TelescopePreviewTitle = { fg = accent, bg = bg_float2 }
    hl.TelescopeBorder       = { fg = nil, bg = bg_float2 }
    hl.TelescopeNormal       = { fg = nil, bg = bg_float2 }
    hl.TelescopeTitle        = { fg = accent, bg = bg_float1 }

    for g, h in pairs(hl) do
      vim.api.nvim_set_hl(0, g, h)
    end
  end,
}
