return {
    "prochri/telescope-all-recent.nvim",
    dependencies = { "telescope.nvim" },
    lazy = true,
    config = function()
        require("telescope-all-recent").setup({})

        -- キーマップ
        -- https://github.com/prochri/telescope-all-recent.nvim/issues/2
        vim.api.nvim_set_keymap("n", "<Leader>ff", "<Cmd>Telescope find_files<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap(
            "n",
            "<Leader>ff",
            "<Cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git', }})<CR>",
            { noremap = true, silent = true }
        )
        vim.api.nvim_set_keymap("n", "<Leader>fr", "<Cmd>Telescope resume<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<Leader>fh", "<Cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
        --vim.api.nvim_set_keymap('n', '<Leader>ft', '<Cmd>Telescope file_browser path=%:p:h<CR>', { noremap = true, silent = true })
        --vim.api.nvim_set_keymap('n', '<leader>fm', "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", { noremap = true, silent = true })
        --vim.api.nvim_set_keymap('n', '<leader>fm', "<Cmd>lua require('telescope').extensions.frecency.frecency({ default_workspace = 'CWD' })<CR>", { noremap = true, silent = true })
    end,
}
