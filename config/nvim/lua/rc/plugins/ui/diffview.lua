-- lua/rc/plugins/ui/diffview.lua
return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
        require("diffview").setup({
            -- diff_bin = "diff", -- Use diff-so-fancy or delta instead
            use_icons = true,
            -- signs = {
            --     add = { text = "▎" },
            --     modify = { text = "▎" },
            --     remove = { text = "" },
            -- },
            -- view = {
            --     -- Choose the layout configuration
            --     default = {
            --         -- Config for the layout with highest priority.
            --         -- The versions laid out as columns.
            --         layout = "diff2_horizontal",
            --     },
            --     merge_tool = {
            --         -- Config for the merge tool layout.
            --         layout = "diff3_mixed",
            --         disable_diagnostics = true, -- Temporarily disable diagnostics for conflict resolution
            --     },
            --     file_history = {
            --         -- Config for the file history layout.
            --         layout = "diff2_horizontal",
            --     },
            -- },
        })

        -- Keymaps
        -- vim.keymap.set("n", "<leader>dv", "<Cmd>DiffviewOpen<CR>", { desc = "Diffview" })
        -- vim.keymap.set("n", "<leader>dc", "<Cmd>DiffviewClose<CR>", { desc = "Diffview close" })
        -- vim.keymap.set("n", "<leader>dh", "<Cmd>DiffviewFileHistory<CR>", { desc = "Diffview file history" })
    end,
}
