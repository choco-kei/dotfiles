--return {
--    "iamcco/markdown-preview.nvim",
--    build = "cd app && yarn install",
--    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--    ft = { "markdown" },
--}

return {
    "oflisback/obsidian-bridge.nvim",
    opts = {
    },
    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("obsidian-bridge").setup({
            scroll_sync = true,
        })
    end,
}

-- return {
--     "jannis-baum/vivify",
--     --ft = { "markdown" },
--     config = function()
--         vim.g.vivify_instant_refresh = 0
--         vim.g.vivify_filetypes = { "vimwiki" }
--     end,
-- }
