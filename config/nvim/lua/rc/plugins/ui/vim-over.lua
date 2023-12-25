return {
    "osyo-manga/vim-over",
    event = "VimEnter",
    config = function()
        vim.keymap.set("n", "[vim-over]", "<Nop>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>m", "[vim-over]", { remap = true, silent = true })
        -- over.vimの起動
        vim.keymap.set("n", "[vim-over]s", ":OverCommandLine<CR>", { remap = true, silent = true })
        -- カーソル下の単語をハイライト付きで置換
        vim.keymap.set(
            "n",
            "[vim-over]c",
            ":OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>",
            { remap = true, silent = true }
        )
    end,
}
