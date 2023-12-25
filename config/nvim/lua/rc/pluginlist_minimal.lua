local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local colorscheme = "nightfox.nvim"

require("lazy").setup({
    {
        "nathom/filetype.nvim",
        config = function()
            require("rc/plugins/filetype")
        end,
    },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Lua Library
    ----------------------------------------------------------------------------------------------------------------------------------
    --{ "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "tami5/sqlite.lua" },
    { "MunifTanjim/nui.nvim" },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- ColorScheme
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "EdenEast/nightfox.nvim",
    --    config = function()
    --        require("rc/plugins/nightfox")
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Completion
    ----------------------------------------------------------------------------------------------------------------------------------
    -- nvim-cmp
    --{
    --    "hrsh7th/nvim-cmp",
    --    dependencies = { "lspkind-nvim", "LuaSnip", "nvim-autopairs" },
    --    --event = { "InsertEnter" },
    --    config = function()
    --        require("rc/plugins/nvim-cmp")
    --    end,
    --},
    --{ "hrsh7th/cmp-nvim-lsp",                 dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-nvim-lsp-signature-help",  dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-nvim-lsp-document-symbol", dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-buffer",                   dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-path",                     dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-omni",                     dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-nvim-lua",                 dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-emoji",                    dependencies = "nvim-cmp" },
    --{ "f3fora/cmp-spell",                     dependencies = "nvim-cmp" },
    --{ "yutkat/cmp-mocword",                   dependencies = "nvim-cmp" },
    --{
    --    "uga-rosa/cmp-dictionary",
    --    dependencies = "nvim-cmp",
    --    config = function()
    --        require("rc/plugins/cmp-dictionary")
    --    end,
    --},
    --{ "saadparwaiz1/cmp_luasnip", dependencies = "nvim-cmp" },
    ----{ "ray-x/cmp-treesitter", dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-cmdline",      dependencies = "nvim-cmp" },
    --{
    --    "tzachar/cmp-tabnine",
    --    build = "./install.sh",
    --    dependencies = "nvim-cmp",
    --    config = function()
    --        require("rc/plugins/cmp-tabnine")
    --    end,
    --},

    --{ "zbirenbaum/copilot-cmp", dependencies = { "nvim-cmp", "copilot.lua" } },
    --{ "hrsh7th/cmp-copilot", dependencies = "nvim-cmp" },
    --{ "hrsh7th/cmp-calc", dependencies = "nvim-cmp" },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Snippet
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "L3MON4D3/LuaSnip",
    --    --event = { "InsertEnter", "CmdlineEnter" },
    --    event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/LuaSnip")
    --    end,
    --},
    --{ "rafamadriz/friendly-snippets" },
    --{
    --    "kevinhwang91/nvim-hclipboard",
    --    dependencies = { "LuaSnip" },
    --    config = function()
    --        require("hclipboard").start()
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "neovim/nvim-lspconfig",
    --    dependencies = "cmp-nvim-lsp",
    --    --commit = "3d67dfd8a6d7fb8f1ded38f0f8b6a51f5cec3225",
    --    config = function()
    --        require("rc/plugins/nvim-lspconfig")
    --    end,
    --},
    --{
    --    "williamboman/mason-lspconfig.nvim",
    --    dependencies = "mason.nvim",
    --    config = function()
    --        require("rc/plugins/mason-lspconfig")
    --    end,
    --},
    --{
    --    "williamboman/mason.nvim",
    --    dependencies = { "nvim-lspconfig", "vim-illuminate", "nlsp-settings.nvim" },
    --    build = ":MasonUpdate",
    --    config = function()
    --        require("rc/plugins/mason")
    --    end,
    --},
    --{
    --    "jay-babu/mason-nvim-dap.nvim",
    --    dependencies = { "mason.nvim", "nvim-dap" },
    --    config = function()
    --        require("rc/plugins/mason-nvim-dap")
    --    end,
    --},
    --{
    --    "tamago324/nlsp-settings.nvim",
    --    dependencies = { "nvim-lspconfig" },
    --    config = function()
    --        require("rc/plugins/nlsp-settings")
    --    end,
    --},
    --{
    --    "onsails/lspkind-nvim",
    --    --event = "VimEnter",
    --    --dependencies = { "nvim-lsp-installer" },
    --    config = function()
    --        require("rc/plugins/lspkind-nvim")
    --    end,
    --},

    -- UI
    --{
    --    'ray-x/guihua.lua',
    --    build = 'cd lua/fzy && make',
    --    config = function()
    --        require('rc/plugins/guihua')
    --    end,
    --},
    --{
    --    'ray-x/navigator.lua',
    --    dependencies = { 'mason.nvim', 'nvim-treesitter'},
    --    config = function()
    --        require('rc/plugins/navigator')
    --    end,
    --},
    --{
    --    'utilyre/barbecue.nvim',
    --    dependencies = { 'nvim-lspconfig', 'SmiteshP/nvim-navic', 'nvim-tree/nvim-web-devicons' },
    --    config = function()
    --        require('rc/plugins/barbecue')
    --    end,
    --},
    --{
    --    'j-hui/fidget.nvim',
    --    dependencies = { 'mason.nvim' },
    --    tag = 'legacy',
    --    config = function()
    --        require('rc/plugins/fidget')
    --    end,
    --},


    ----------------------------------------------------------------------------------------------------------------------------------
    -- telescope
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "nvim-telescope/telescope.nvim",
    --    keys = { "<Leader>f" },
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/telescope")
    --    end,
    --},
    --{
    --    "prochri/telescope-all-recent.nvim",
    --    dependencies = { "telescope.nvim" },
    --    config = function()
    --        require("rc/plugins/telescope-all-recent")
    --    end,
    --},
    --{
    --    "nvim-telescope/telescope-dap.nvim",
    --    dependencies = { "telescope.nvim" },
    --    config = function()
    --        require("telescope").load_extension("dap")
    --    end,
    --},


    ----------------------------------------------------------------------------------------------------------------------------------
    -- nvim-treesitter
    ----------------------------------------------------------------------------------------------------------------------------------
    {
        'nvim-treesitter/nvim-treesitter',
        --event = 'VimEnter',
        build = ':TSUpdate',
        config = function()
            require('rc/plugins/nvim-treesitter')
        end,
    },


    ----------------------------------------------------------------------------------------------------------------------------------
    -- 検索
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "RRethy/vim-illuminate",
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/vim-illuminate")
    --    end,
    --},
    --{
    --    "t9md/vim-quickhl",
    --    --event = "VimEnter",
    --    config = function()
    --        vim.cmd("source ~/.config/nvim/rc/plugins/vim-quickhl.vim")
    --    end,
    --},
    --{
    --    "kevinhwang91/nvim-hlslens",
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/vim-hlslens")
    --    end,
    --},
    --{
    --    "folke/todo-comments.nvim",
    --    dependencies = { "telescope.nvim" },
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/todo-comments")
    --    end,
    --},


    ----------------------------------------------------------------------------------------------------------------------------------
    -- 操作
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    'phaazon/hop.nvim',
    --    --event = 'VimEnter',
    --    config = function()
    --        require('rc/plugins/hop')
    --    end,
    --},


    ----------------------------------------------------------------------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    'nvim-neo-tree/neo-tree.nvim',
    --    branch = 'main',
    --    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    --    keys = { '<Leader>t' },
    --    --event = 'VimEnter',
    --    config = function()
    --        require('rc/plugins/neo-tree')
    --    end,
    --},
    --{
    --    'editorconfig/editorconfig-vim',
    --    --event = 'VimEnter',
    --},
    --{
    --    'nvim-tree/nvim-web-devicons',
    --    --event = 'VimEnter',
    --    config = function()
    --        require('rc/plugins/nvim-web-devicons')
    --    end,
    --},
    --{
    --    'osyo-manga/vim-over',
    --    --event = 'VimEnter',
    --    config = function()
    --        vim.cmd('source ~/.config/nvim/rc/plugins/vim-over.vim')
    --    end,
    --},
    --{
    --    'nvim-lualine/lualine.nvim',
    --    --event = 'VimEnter',
    --    config = function()
    --        require('rc/plugins/lualine')
    --    end,
    --},
    --{
    --    'lukas-reineke/indent-blankline.nvim',
    --    --event = 'VimEnter',
    --    dependencies = { colorscheme },
    --    config = function()
    --        require('rc/plugins/indent-blankline')
    --    end,
    --},
    --{
    --    'petertriho/nvim-scrollbar',
    --    dependencies = { colorscheme, 'nvim-hlslens' },
    --    config = function()
    --        require('rc/plugins/nvim-scrollbar')
    --    end,
    --},
    --{
    --    'akinsho/bufferline.nvim',
    --    dependencies = colorscheme,
    --    config = function()
    --        require('rc/plugins/bufferline')
    --    end,
    --},
    --{
    --    'mvllow/modes.nvim',
    --    dependencies = colorscheme,
    --    tag = 'v0.2.0',
    --    config = function()
    --        require('rc/plugins/modes')
    --    end,
    --},
    --{
    --    'sidebar-nvim/sidebar.nvim',
    --    config = function()
    --        require('rc/plugins/sidebar')
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Insert/Edit
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "junegunn/vim-easy-align",
    --    --event = "VimEnter",
    --    config = function()
    --        vim.cmd("source ~/.config/nvim/rc/plugins/vim-easy-align.vim")
    --    end,
    --},
    --{
    --    "windwp/nvim-autopairs",
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/nvim-autopairs")
    --    end,
    --},
    --{ "nicwest/vim-camelsnek" },

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Yank
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "gbprod/yanky.nvim",
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/yanky")
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Operator
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "gbprod/substitute.nvim",
    --    --event = "VimEnter",
    --    config = function()
    --        require("rc/plugins/substitute")
    --    end,
    --},
    --{
    --    "machakann/vim-sandwich",
    --    --event = "VimEnter",
    --    config = function()
    --        vim.cmd("source ~/.config/nvim/rc/plugins/vim-sandwich.vim")
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Lint
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "nvimtools/none-ls.nvim",
    --    dependencies = "mason.nvim",
    --    config = function()
    --        require("rc/plugins/none-ls")
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Terminal
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "akinsho/toggleterm.nvim",
    --    config = function()
    --        require("rc/plugins/toggleterm")
    --    end,
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Debugger
    ----------------------------------------------------------------------------------------------------------------------------------
    --{
    --    "mfussenegger/nvim-dap",
    --    dependencies = { "nvim-dap-ui" },
    --    config = function()
    --        require("rc/plugins/nvim-dap")
    --    end,
    --},
    --{
    --    "rcarriga/nvim-dap-ui",
    --},

    ----------------------------------------------------------------------------------------------------------------------------------
    -- FileType
    ----------------------------------------------------------------------------------------------------------------------------------
    ---- php
    --{
    --    "2072/PHP-Indenting-for-VIm",
    --    ft = { "php" },
    --    config = function()
    --        vim.cmd("source ~/.config/nvim/rc/plugins/PHP-Indenting-for-VIm.vim")
    --    end,
    --},
    ---- blade
    --{
    --    "jwalton512/vim-blade",
    --    ft = { "blade", "blade.php" },
    --},
    ---- log
    --{
    --    "MTDL9/vim-log-highlighting",
    --    ft = { "log" },
    --},
    ---- Markdown
    --{
    --    "iamcco/markdown-preview.nvim",
    --    build = "cd app && yarn install",
    --    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --    ft = { "markdown" },
    --    config = function()
    --        vim.cmd('source ~/.config/nvim/rc/plugins/markdown-preview.vim')
    --    end,
    --},
})
