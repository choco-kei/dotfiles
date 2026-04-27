return {
  "folke/snacks.nvim",
  -- enabled = false,
  priority = 1000,
  lazy = false,

  opts = {
    bigfile = { enabled = true },

    --dashboard = { enabled = true },

    explorer = { enabled = true },

    image = {
      enabled = true,
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 80,
        max_height = 40,
      },
    },

    notifier = { enabled = true, timeout = 3000 },

    statuscolumn = {
      enabled = true,
      left = { "mark", "sign" },
      right = { "fold", "number", "git" },
      folds = {
        open = true,
        git_hl = true,
      },
      sections = {
        patterns = { "GitSign" },
      },
      refresh = 50,
    },

    indent = {
      enabled = true,
      char = "│",
      animate = {
        duration = {
          step = 15,
          total = 150,
        },
      },
      scope = {
        enabled = true,
        hl = {
          "rainbow1",
          "rainbow2",
          "rainbow3",
          "rainbow4",
          "rainbow5",
          "rainbow6",
        },
      },
      chunk = {
        enabled = true,
        hl = {
          "rainbow1",
          "rainbow2",
          "rainbow3",
          "rainbow4",
          "rainbow5",
          "rainbow6",
        },
        char = {
          -- corner_top = "┌",
          -- corner_bottom = "└",
          corner_top = "┌",
          corner_bottom = "╰",
          horizontal = "─",
          vertical = "│",
          arrow = "󰁔",
        },
      },
    },

    picker = {
      enabled = true,
      sources = {
        files = {
          hidden = true,
          ignored = false,
        },
        explorer = {
          auto_close = false,
          jump = {
            close = true,
          },
          actions = {
            explorer_copy = function(picker, item)
              if not item then
                return
              end

              local Tree = require("snacks.explorer.tree")
              local Actions = require("snacks.explorer.actions")
              local uv = vim.uv or vim.loop

              local paths = vim.tbl_map(Snacks.picker.util.path, picker:selected())
              if #paths > 0 then
                local dir = picker:dir()
                Snacks.picker.util.copy(paths, dir)
                picker.list:set_selected()
                Tree:refresh(dir)
                Tree:open(dir)
                Actions.update(picker, { target = dir })
                return
              end

              Snacks.input({
                prompt = "Copy to",
                default = vim.fn.fnamemodify(item.file, ":t"),
              }, function(value)
                if not value or value:find("^%s$") then
                  return
                end

                local dir = vim.fs.dirname(item.file)
                local to = vim.fs.normalize(dir .. "/" .. value)
                if uv.fs_stat(to) then
                  Snacks.notify.warn("File already exists:\n- `" .. to .. "`")
                  return
                end
                Snacks.picker.util.copy_path(item.file, to)
                Tree:refresh(vim.fs.dirname(to))
                Actions.update(picker, { target = to })
              end)
            end,
          },
        },
        gh_issue = {},
        gh_pr = {},
      },
      prompt = "   ",
      wo = {
        number = true,
        relativenumber = false,
        signcolumn = "no",
      },
      --layout = "borderless",
      layout = "borderless",
      layouts = {
        select = {
          hidden = { "preview" },
          layout = {
            backdrop = true,
            width = 0.5,
            min_width = 80,
            max_width = 100,
            height = 0.4,
            min_height = 2,
            box = "vertical",
            border = false,
            title = "{title}",
            title_pos = "center",
            { win = "input", height = 1, border = "top_bottom" },
            { win = "list", border = "bottom" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
        borderless = {
          layout = {
            box = "horizontal",
            backdrop = true,
            width = 0.8,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              { win = "input", height = 1, border = "rounded", title = "{title} {live} {flags}", title_pos = "center" },
              { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.5,
              border = "rounded",
              title_pos = "center",
            },
          },
        },
      },
      icons = {
        ui = {
          live = "󰐰 ",
        },
      },
      toggles = {
        hidden = "󰘓",
        ignored = "",
        follow = "",
      },
    },

    input = {
      enabled = true,
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
      },
    },

    rename = { enabled = true },
  },

  -- stylua: ignore start
  keys = {
    -- ════════════════════════════════════════════════════════════════════
    -- <leader>e = Explorer
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>ee", function() Snacks.explorer({ hidden = true, ignored = true }) end, desc = "Explorer" },
    { "<leader>ec", function() Snacks.explorer({ hidden = true, ignored = true, reveal = true }) end, desc = "Explorer Current" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>b = Buffers
    -- ════════════════════════════════════════════════════════════════════
    {
      "<leader>bb",
      function()
        Snacks.picker.buffers({
          win = {
            input = { keys = { ["dd"] = "bufdelete", ["<C-d>"] = { "bufdelete", mode = { "n", "i" } } } },
            list = { keys = { ["dd"] = "bufdelete" } },
          },
        })
      end,
      desc = "Buffers",
    },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers" },
    { "<leader>bn", function() Snacks.scratch() end, desc = "Scratch Buffer" },
    { "tq", function() Snacks.bufdelete() end, desc = "Delete Buffer" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>d = Diagnostics
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>dd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>dw", function() Snacks.picker.diagnostics() end, desc = "Workspace Diagnostics" },
    { "<leader>dq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>dl", function() Snacks.picker.loclist() end, desc = "Location List" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>f = Files
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent Files" },
    { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fR", function() Snacks.rename.rename_file() end, desc = "Rename File" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>g = Git
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Log (line)" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Log (file)" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Diff (picker)" },
    { "<leader>gc", function() Snacks.picker.git_branches() end, desc = "Checkout Branch" },
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open in Browser", mode = { "n", "v" } },
    -- -- GitHub
    -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "Issues" },
    -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "Issues (all)" },
    -- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "Pull Requests" },
    -- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "Pull Requests (all)" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>n = Notifications
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification: Show History" },
    { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Notification: Dismiss All" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>l = LSP
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
    { "<leader>lw", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>s = Search
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Word", mode = { "n", "x" } },
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Buffers" },
    { "<leader>sh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>s:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>s/", function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>sr", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume Last" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },

    -- ════════════════════════════════════════════════════════════════════
    -- <leader>u = UI / Toggles
    -- ════════════════════════════════════════════════════════════════════
    { "<leader>uc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>uh", function() Snacks.picker.highlights() end, desc = "Highlight Groups" },
    { "<leader>uz", function() Snacks.zen() end, desc = "Zen Mode" },
    { "<leader>uZ", function() Snacks.zen.zoom() end, desc = "Zoom" },
    {
      "<leader>uN",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
        })
      end,
      desc = "Neovim News",
    },

    -- ════════════════════════════════════════════════════════════════════
    -- g = Goto (LSP navigation via Snacks picker)
    -- ════════════════════════════════════════════════════════════════════
    { "gr", function() vim.lsp.buf.rename() end, desc = "Rename" },
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Declaration" },
    { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definition" },
    { "gh", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Implementation" },
    -- gx: CodeAction

    -- ════════════════════════════════════════════════════════════════════
    -- Terminal
    -- ════════════════════════════════════════════════════════════════════
    { "<C-_>", function() Snacks.terminal.toggle() end, desc = "Terminal: Open" },
    --{ "<C-/>", function() Snacks.terminal() end, desc = "Terminal: which_key_ignore" }, -- <C-_>:signature_help
  },
  -- stylua: ignore end

  config = function(_, opts)
    require("snacks").setup(opts)

    Snacks.keymap.set({ "n", "x" }, "gx", vim.lsp.buf.code_action, {
      lsp = { method = "textDocument/codeAction" },
      desc = "Code Action",
    })

    -- LSP通知
    ---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
    local progress = vim.defaulttable()
    vim.api.nvim_create_autocmd("LspProgress", {
      ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
        if not client or type(value) ~= "table" then
          return
        end
        local p = progress[client.id]

        for i = 1, #p + 1 do
          if i == #p + 1 or p[i].token == ev.data.params.token then
            p[i] = {
              token = ev.data.params.token,
              msg = ("[%3d%%] %s%s"):format(
                value.kind == "end" and 100 or value.percentage or 100,
                value.title or "",
                value.message and (" **%s**"):format(value.message) or ""
              ),
              done = value.kind == "end",
            }
            break
          end
        end

        local msg = {} ---@type string[]
        progress[client.id] = vim.tbl_filter(function(v)
          return table.insert(msg, v.msg) or not v.done
        end, p)

        local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
        vim.notify(table.concat(msg, "\n"), "info", {
          id = "lsp_progress",
          title = client.name,
          opts = function(notif)
            notif.icon = #progress[client.id] == 0 and " "
              or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
          end,
        })
      end,
    })
  end,
}
