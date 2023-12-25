return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup({
            textobjects = { -- syntax-aware textobjects
                select = {
                    enable = true,
                    disable = {},
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["iB"] = "@block.inner",
                        ["aB"] = "@block.outer",
                        -- use sandwich
                        -- ['i'] = '@call.inner',
                        -- ['a'] = '@call.outer',
                        -- ['a'] = '@comment.outer',
                        -- ['iF'] = '@frame.inner',
                        -- ['oF'] = '@frame.outer',
                        ["ii"] = "@conditional.inner",
                        ["ai"] = "@conditional.outer",
                        ["il"] = "@loop.inner",
                        ["al"] = "@loop.outer",
                        ["ip"] = "@parameter.inner",
                        ["ap"] = "@parameter.outer",
                        -- ['iS'] = '@scopename.inner',
                        -- ['aS'] = '@statement.outer',
                    },
                },
                --swap = {
                --    enable = true,
                --    swap_next = { ["'>"] = '@parameter.inner' },
                --    swap_previous = { ["'<"] = '@parameter.inner' },
                --},
                --move = {
                --    enable = true,
                --    goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
                --    goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
                --    goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
                --    goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
                --},
            },
        })
    end,
}
