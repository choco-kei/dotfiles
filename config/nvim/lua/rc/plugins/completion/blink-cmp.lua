return {
    "saghen/blink.cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "windwp/nvim-autopairs",
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
        "ribru17/blink-cmp-spell",
    },
    version = "1.*",
    enabled = true,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = { preset = "luasnip" },

        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "default",
            ["<Tab>"] = { "select_next", "fallback" }, -- 候補選択 (次)
            ["<S-Tab>"] = { "select_prev", "fallback" }, -- 候補選択 (前)
            ["<CR>"] = { "accept", "fallback" }, -- 候補の確定
            ["<C-j>"] = { "snippet_forward", "fallback" }, -- スニペット次へジャンプ
            ["<C-k>"] = { "snippet_backward", "fallback" }, -- スニペット前へジャンプ
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true },
            list = { selection = { preselect = false } }, -- 候補を自動で事前選択しない (nvim-cmpのnoselect挙動)
            menu = {
                max_height = 15,
                draw = {
                    columns = {
                        { "label", gap = 1 }, -- 候補名
                        { "kind_icon", gap = 1 }, -- アイコン
                        { "kind", gap = 1 }, -- 種別名
                        { "bracketed_source_name" }, -- ソース名
                    },
                    components = {
                        bracketed_source_name = {
                            text = function(ctx)
                                return "[" .. ctx.source_name .. "]"
                            end,
                            highlight = "Comment", -- Commentハイライトグループを適用
                        },
                    },
                },
            },
        },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            providers = {
                lsp = { module = "blink.cmp.sources.lsp", score_offset = 100 },
                path = { module = "blink.cmp.sources.path", score_offset = 100 },
                snippets = { module = "blink.cmp.sources.snippets", score_offset = 20 },
                emoji = { module = "blink-emoji", name = "Emoji", score_offset = 60, opts = { insert = true, trigger = function() return { ":" } end } },
                --lua = { module = "blink.cmp.sources.lua", score_offset = 50 },
                signature_help = { module = "blink.cmp.sources.signature_help", score_offset = 80 },
                omni = { module = "blink.cmp.sources.complete_func", score_offset = 40 },
                spell = { module = "blink-cmp-spell", name = "Spell", score_offset = 40 },
                -- buffer = { module = "blink.cmp.sources.buffer", score_offset = 30 }
                buffer = {
                  module = "blink.cmp.sources.buffer",
                  score_offset = 30,
                  transform_items = function(_, items)
                    return vim.tbl_filter(function(item)
                      --return not item.label:match("[^\x00-\x7f]") -- 日本語を除外
                      return not item.label:match("[ぁ-んァ-ヶ一-龠]")
                    end, items)
                  end,
                },
            },
            --default = { "lsp", "path", "snippets", "buffer", "emoji", "omni", "spell" },
            default = { "lsp", "path", "snippets", "buffer", "emoji", "spell" },
        },

        cmdline = {
            completion = {
                list = {
                    selection = {
                        preselect = false,
                    },
                },
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true }, -- シグネチャヘルプを有効化
    },
    opts_extend = { "sources.default" },
}
