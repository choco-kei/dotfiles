return {
  "kevinhwang91/nvim-hlslens",
  event = "VeryLazy",
  config = function()
    local hlslens = require("hlslens")

    hlslens.setup({
      nearest_only = true,
      override_lens = function(render, posList, nearest, idx, relIdx)
        local sfw = vim.v.searchforward == 1
        local indicator, text, chunks
        local absRelIdx = math.abs(relIdx)
        if absRelIdx > 1 then
          indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and "" or "")
        elseif absRelIdx == 1 then
          indicator = sfw ~= (relIdx == 1) and "" or ""
        else
          indicator = ""
        end

        local lnum, col = unpack(posList[idx])
        if nearest then
          local cnt = #posList
          if indicator ~= "" then
            text = ("[%s %d/%d]"):format(indicator, idx, cnt)
          else
            text = ("[%d/%d]"):format(idx, cnt)
          end
          chunks = { { " " }, { text, "HlSearchLensNear" } }
        else
          text = ("[%s %d]"):format(indicator, idx)
          chunks = { { " " }, { text, "HlSearchLens" } }
        end
        render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    })

    local kopts = { silent = true }

    local function start_search(keys, with_count)
      return function()
        local prefix = with_count and tostring(vim.v.count1) or ""
        vim.cmd.normal({ args = { prefix .. keys }, bang = true })
        hlslens.start()
      end
    end

    vim.keymap.set("n", "n", start_search("n", true), kopts)
    vim.keymap.set("n", "N", start_search("N", true), kopts)
    vim.keymap.set("n", "*", start_search("*"), kopts)
    vim.keymap.set("n", "#", start_search("#"), kopts)
    vim.keymap.set("n", "g*", start_search("g*"), kopts)
    vim.keymap.set("n", "g#", start_search("g#"), kopts)
  end,
}
