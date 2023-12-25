return {
    "junegunn/vim-easy-align",
    --event = "VimEnter",
    config = function()
        vim.cmd("source ~/.config/nvim/rc/configs/vim-easy-align.vim")
        -- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
        vim.keymap.set("v", "<Enter> ", "<Plug>(EasyAlign)")

        -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
        --vim.keymap.set("n", "ga ", "<Plug>(EasyAlign)")
    end,
}
