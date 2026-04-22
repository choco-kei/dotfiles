return {
  "nvim-tree/nvim-web-devicons",
  event = "VimEnter",
  opts = {
    override_by_extension = {
      ["blade.php"] = {
        icon = "󰫐",
        color = "#f05340",
        cterm_color = "203",
        name = "Blade",
      },
    },
  },
}
