require('nvim-treesitter.configs').setup {
    indent = {
        enable = true,
        disable = { 'html', 'javascript' }
    },
    -- And optionally, disable the conflict warning emitted by plugin
    yati = {
        suppress_conflict_warning = true,
    },
}
