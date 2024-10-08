-- nvim-cmp+cmp-omniでcmdheightが増加する問題を対応
local cmp = require('cmp')
local sources = cmp.get_config().sources
for i = #sources, 1, -1 do
    if sources[i].name == 'omni' then
        table.remove(sources, i)
    end
end
cmp.setup.buffer({ sources = sources })

-- commentstringを変更
vim.bo.commentstring = "//%s"
