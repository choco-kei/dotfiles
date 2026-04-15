return {
  "luukvbaal/statuscol.nvim",
  event = "VimEnter",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      ft_ignore = { "help", "terminal", "neo-tree", "alpha" },
      thousands = false,
      -- relculright = true,
      foldfunc = "builtin",
      setopt = true,
      segments = {
        {
          -- gitsigns
          sign = {
            namespace = { "gitsigns" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
          click = "v:lua.ScSa",
        },
        {
          -- diagnostic
          sign = {
            namespace = { "diagnostic" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
          click = "v:lua.ScSa",
        },
        {
          sign = {
            name = { ".*" },
            maxwidth = 1,
            colwidth = 1,
            auto = true,
          },
        },
        {
          text = { "\u{200A}" }, -- Hair space
        },
        {
          -- fold
          text = { builtin.foldfunc },
          maxwidth = 1,
          colwidth = 1,
          click = "v:lua.ScFa",
          auto = true,
          hl = "Folded",
        },
        {
          text = { "\u{200A}" }, -- Hair space
        },
        {
          -- 行番号
          text = { builtin.lnumfunc },
          click = "v:lua.ScLa",
        },
        {
          text = { "\u{200A}" }, -- Hair space
        },
      },
    })

    vim.o.numberwidth = 2
  end,
}
