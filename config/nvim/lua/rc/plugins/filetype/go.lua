return {
  {
    "fang2hou/go-impl.nvim",
    ft = "go",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "folke/snacks.nvim",
    },
    opts = {
      picker = "snacks",

      insert = {
        position = "after",
        before_newline = true,
        after_newline = false,
      },
    },
    keys = {
      {
        "<leader>lgi",
        function()
          require("go-impl").open()
        end,
        mode = { "n" },
        ft = "go",
        desc = "Go: Generate Implementation",
      },
    },
    config = function(_, opts)
      -- nui.nvimでnormalモードが使えるように
      require("go-impl.ui").get_receiver = function(default_value, callback)
        local cfg = require("go-impl.config")
        local text = require("nui.text")
        local input = require("nui.input")(
          vim.tbl_deep_extend("force", cfg.options.style.receiver_input, {
            border = {
              text = {
                top = require("nui.line")({
                  text(" [ "),
                  text(cfg.options.icons.go.text, cfg.options.icons.go.hl),
                  text("Receiver", "Fg"),
                  text(" ] "),
                }),
              },
            },
          }),
          {
            prompt = text(cfg.options.prompt.receiver, "GoImplHighlight"),
            default_value = default_value,
            on_close = callback,
            on_submit = callback,
          }
        )

        input:mount()
        input:on(require("nui.utils.autocmd").event.BufLeave, function()
          input:unmount()
        end)
        input:map("n", "<Esc>", function()
          input:unmount()
        end, { noremap = true })
      end

      require("go-impl").setup(opts)
    end,
  },
}
