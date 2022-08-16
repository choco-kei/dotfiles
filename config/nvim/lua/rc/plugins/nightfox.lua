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
  }
}

require('nightfox').setup({ palettes = palettes })

vim.cmd([[ colorscheme nordfox ]])
