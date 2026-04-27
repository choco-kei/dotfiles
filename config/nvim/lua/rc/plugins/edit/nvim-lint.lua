return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local uv = vim.uv or vim.loop

    local project_linters = {
      php = {
        markers = { "phpcs.xml", "phpcs.xml.dist", "ruleset.xml" },
        names = { "phpcs" },
        executable = function(root)
          local local_bin = vim.fs.joinpath(root, "vendor", "bin", "phpcs")
          return uv.fs_stat(local_bin) ~= nil or vim.fn.executable("phpcs") == 1
        end,
      },
      proto = {
        markers = { "buf.yaml" },
        names = { "buf_lint" },
        executable = function()
          return vim.fn.executable("buf") == 1
        end,
      },
    }

    local function find_project_root(bufnr, markers)
      local buffer_name = vim.api.nvim_buf_get_name(bufnr)
      if buffer_name == "" then
        return nil
      end

      local marker = vim.fs.find(markers, {
        path = vim.fs.dirname(buffer_name),
        upward = true,
        type = "file",
        limit = 1,
      })[1]

      return marker and vim.fs.dirname(marker) or nil
    end

    local function lint_buffer(bufnr)
      if not vim.api.nvim_buf_is_valid(bufnr) or vim.bo[bufnr].buftype ~= "" then
        return
      end

      local spec = project_linters[vim.bo[bufnr].filetype]
      if not spec then
        return
      end

      local root = find_project_root(bufnr, spec.markers)
      if not root or not spec.executable(root) then
        return
      end

      vim.api.nvim_buf_call(bufnr, function()
        lint.try_lint(spec.names, { cwd = root })
      end)
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = lint_augroup,
      callback = function(args)
        lint_buffer(args.buf)
      end,
    })
  end,
}
