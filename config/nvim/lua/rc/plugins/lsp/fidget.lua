return {
    "j-hui/fidget.nvim",
    event = "VimEnter",
    config = function()
        local fidget_notification = require("fidget.notification")

        require("fidget").setup({
            notification = {
                override_vim_notify = true,
                configs = {
                    -- 通知グループごとの設定
                    default = vim.tbl_extend("force", fidget_notification.default_config, {
                        ttl = 8,
                    }),
                },
            },
        })
    end,
}
