vim.api.nvim_create_user_command("CopyPath", function()
    -- 現在のファイルパスを取得し、クリップボードにコピー
    local file_path = vim.fn.expand("%")
    vim.fn.setreg("*", file_path)
    print("copied")
end, {})

vim.api.nvim_create_user_command("JsonFormat", function()
    vim.cmd("%!jq .")
end, {})
