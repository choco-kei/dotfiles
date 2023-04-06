require('todo-comments').setup({
    --signs = true, -- show icons in the signs column
    --sign_priority = 8, -- sign priority
    ---- keywords recognized as todo comments
    --keywords = {
    --    FIX = {
    --        icon = ' ', -- icon used for the sign, and in search results
    --        color = 'error', -- can be a hex color, or a named color (see below)
    --        alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
    --        -- signs = false, -- configure signs for some keywords individually
    --    },
    --    TODO = { icon = ' ', color = 'info' },
    --    HACK = { icon = ' ', color = 'warning' },
    --    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
    --    PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    --    NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
    --},
    search = {
        command = 'rg',
        args = {
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
    highlight = {
        exclude = { 'log' }, -- list of file types to exclude highlighting
    },
})
