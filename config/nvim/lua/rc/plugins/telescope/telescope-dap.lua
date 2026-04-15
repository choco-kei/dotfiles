return {
    "nvim-telescope/telescope-dap.nvim",
    enabled = false,
    lazy = true,
    config = function()
        require("telescope").load_extension("dap")
    end,
}
