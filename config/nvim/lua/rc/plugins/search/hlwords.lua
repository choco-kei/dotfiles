return {
  "AT-AT/hlwords.nvim",
  main = "hlwords",
  keys = {
    {
      "<Space>m",
      function()
        require("hlwords").toggle()
      end,
      mode = { "n", "x" },
      desc = "Toggle word highlight",
    },
    {
      "<Space>M",
      function()
        require("hlwords").clear()
      end,
      mode = { "n", "x" },
      desc = "Clear word highlights",
    },
  },
  opts = function()
    local function fallback_colors()
      return {
        { fg = "#24273a", bg = "#8aadf4" },
        { fg = "#24273a", bg = "#a6da95" },
        { fg = "#24273a", bg = "#c6a0f6" },
        { fg = "#24273a", bg = "#f5a97f" },
        { fg = "#24273a", bg = "#8bd5ca" },
        { fg = "#24273a", bg = "#eed49f" },
        { fg = "#24273a", bg = "#ed8796" },
        { fg = "#24273a", bg = "#7dc4e4" },
        { fg = "#24273a", bg = "#f5bde6" },
        { fg = "#24273a", bg = "#b7bdf8" },
      }
    end

    local function catppuccin_colors()
      local ok, palettes = pcall(require, "catppuccin.palettes")
      if not ok then
        return nil
      end

      local c = palettes.get_palette()
      if not c then
        return nil
      end

      return {
        { fg = c.base, bg = c.blue },
        { fg = c.base, bg = c.green },
        { fg = c.base, bg = c.mauve },
        { fg = c.base, bg = c.peach },
        { fg = c.base, bg = c.teal },
        { fg = c.base, bg = c.yellow },
        { fg = c.base, bg = c.red },
        { fg = c.base, bg = c.sapphire },
        { fg = c.base, bg = c.pink },
        { fg = c.base, bg = c.lavender },
      }
    end

    return {
      -- The number of swatches is the simultaneous highlight limit.
      colors = catppuccin_colors() or fallback_colors(),
      highlight_priority = 15,
      random = false,
      strict_word = false,
    }
  end,
}
