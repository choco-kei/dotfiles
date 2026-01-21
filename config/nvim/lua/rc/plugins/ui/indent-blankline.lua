return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VimEnter",
    dependencies = { COLOR_SCHEME },
    config = function()
        local highlight = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        }
        local hooks = require("ibl.hooks")

        vim.g.rainbow_delimiters = { highlight = highlight }
        require("ibl").setup({
            scope = { highlight = highlight },
            indent = {
                char = "│",
            },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
