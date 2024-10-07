return {
    "nvim-tree/nvim-web-devicons",
    event = "VimEnter",
    config = function()
        require("nvim-web-devicons").setup({
            override_by_extension = {
                ["blade.php"] = {
                    icon = "󰫐",
                    color = "#f05340",
                    cterm_color = "203",
                    name = "Blade",
                },
            },
        })
    end,
}
