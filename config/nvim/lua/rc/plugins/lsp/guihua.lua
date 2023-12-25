return {
    "ray-x/guihua.lua",
    build = "cd lua/fzy && make",
    config = function()
        require("guihua.maps").setup({
            maps = {
                close_view = "<C-g>",
            },
            title = false,
        })
    end,
}
