-- TODO: mini.hipatternsに
return {
    {
        "norcalli/nvim-colorizer.lua",
        event = {
            "BufReadPost",
            "BufNewFile",
        },
        enabled = true,
        init = function()
            vim.opt.termguicolors = true
        end,
        opts = {
            "css",
            "scss",
            "javascript",
            "html",
        },
    },
}
