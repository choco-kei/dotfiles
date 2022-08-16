local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("silent !git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
--if vim.fn.executable('python3') == 1 then
--    vim.cmd(
--        [[let g:python_version = substitute(system("python3 -c 'from sys import version_info as v; print(v[0] * 100 + v[1])'"), '\n', '', 'g')]]
--    )
--end

vim.cmd([[packadd packer.nvim]])

--require('rc/packer')

return require('packer').startup(function(use)
    use({ 'wbthomason/packer.nvim', opt = true })


    ----------------------------------------------------------------------------------------------------------------------------------
    -- Lua Library
    ----------------------------------------------------------------------------------------------------------------------------------
    use({ 'nvim-lua/popup.nvim' })
    use({ 'nvim-lua/plenary.nvim' })
    use({ 'tami5/sqlite.lua', module = 'sqlite' })
    use({ 'MunifTanjim/nui.nvim' })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- SolorScheme
    ----------------------------------------------------------------------------------------------------------------------------------
    --local colorscheme = 'iceberg.nvim'
    --use({
    --    'cocopon/iceberg.vim',
    --    config = function()
    --        require('rc/plugins/iceberg')
    --    end,
    --})
    local colorscheme = 'nightfox.nvim'
    use({
        'EdenEast/nightfox.nvim',
        config = function()
            require('rc/plugins/nightfox')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Completion
    ----------------------------------------------------------------------------------------------------------------------------------
    -- nvim-cmp
    use({
        'hrsh7th/nvim-cmp',
        after = { 'lspkind-nvim', 'LuaSnip', 'nvim-autopairs' },
        --event = { 'InsertEnter' },
        config = function()
            require('rc/plugins/nvim-cmp')
        end,
    })
    use({ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-path', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-omni', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-emoji', after = 'nvim-cmp' })
    use({ 'f3fora/cmp-spell', after = 'nvim-cmp' })
    use({ 'yutkat/cmp-mocword', after = 'nvim-cmp' })
    use({
        'uga-rosa/cmp-dictionary',
        after = 'nvim-cmp',
        config = function()
            require('rc/plugins/cmp-dictionary')
        end,
    })
    use({ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' })
    --use({ 'ray-x/cmp-treesitter', after = 'nvim-cmp' })
    use({ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' })

    --use({ 'zbirenbaum/copilot-cmp', after = { 'nvim-cmp', 'copilot.lua' } })
    --use({ 'hrsh7th/cmp-copilot', after = 'nvim-cmp' })
    --use({ 'hrsh7th/cmp-calc', after = 'nvim-cmp' })

    --use({
    --    'tzachar/cmp-tabnine',
    --    run = './install.sh',
    --    after = 'nvim-cmp',
    --})

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Snippet
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'L3MON4D3/LuaSnip',
        event = { 'InsertEnter', 'CmdlineEnter' },
        config = function()
            require('rc/plugins/LuaSnip')
        end,
    })
    use({ 'rafamadriz/friendly-snippets' })
    use({
        'kevinhwang91/nvim-hclipboard',
        after = { 'LuaSnip' },
        config = function()
            require('hclipboard').start()
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- LSP
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'neovim/nvim-lspconfig',
        after = 'cmp-nvim-lsp',
        config = function()
            require('rc/plugins/nvim-lspconfig')
        end,
    })
    use({
        'williamboman/nvim-lsp-installer',
        requires = { { 'RRethy/vim-illuminate', opt = true } },
        after = { 'nvim-lspconfig', 'vim-illuminate', 'nlsp-settings.nvim' },
        config = function()
            require('rc/plugins/nvim-lsp-installer')
        end,
    })
    use({
        'onsails/lspkind-nvim',
        --event = 'VimEnter',
        --after = { 'nvim-lsp-installer' },
        config = function()
            require('rc/plugins/lspkind-nvim')
        end,
    })
    use({
        'tamago324/nlsp-settings.nvim',
        after = { 'nvim-lspconfig' },
        config = function()
            require('rc/plugins/nlsp-settings')
        end,
    })

    -- UI
    --use({
    --    'tami5/lspsaga.nvim',
    --    after = 'nvim-lsp-installer',
    --    config = function()
    --        require('rc/plugins/lspsaga')
    --    end,
    --})
    --use {
    --    'folke/trouble.nvim',
    --    requires = 'kyazdani42/nvim-web-devicons',
    --    config = function()
    --        require('rc/plugins/trouble')
    --    end,
    --}
    use({
        'ray-x/guihua.lua',
        run = 'cd lua/fzy && make',
        config = function()
            require('rc/plugins/guihua')
        end,
    })
    use({
        'ray-x/navigator.lua',
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        after = { 'nvim-lsp-installer'},
        config = function()
            require('rc/plugins/navigator')
        end,
    })
    use({
        'j-hui/fidget.nvim',
        after = { 'nvim-lsp-installer' },
        config = function()
            require('rc/plugins/fidget')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- telescope
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'nvim-telescope/telescope.nvim',
        --cmd = { 'Telescope' },
        keys = { '<Leader>f' },
        config = function()
            require('rc/plugins/telescope')
        end,
    })
    use({
        'nvim-telescope/telescope-frecency.nvim',
        after = { 'telescope.nvim' },
        config = function()
            require('telescope').load_extension('frecency')
        end,
    })
    use({
        'nvim-telescope/telescope-packer.nvim',
        after = { 'telescope.nvim' },
        config = function()
            require('telescope').load_extension('packer')
        end,
    })
    use({
        'nvim-telescope/telescope-file-browser.nvim',
        after = { 'telescope.nvim' },
        config = function()
            require('telescope').load_extension('file_browser')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- nvim-treesitter
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'nvim-treesitter/nvim-treesitter',
        event = 'VimEnter',
        run = ':TSUpdate',
        config = function()
            require('rc/plugins/nvim-treesitter')
        end,
    })
    use({ 'JoosepAlviste/nvim-ts-context-commentstring', after = { 'nvim-treesitter' } })
    use({ 'yioneko/nvim-yati', after = 'nvim-treesitter' })

    -- UI
    use({ 'p00f/nvim-ts-rainbow', after = { 'nvim-treesitter' } })
    use({ 'haringsrob/nvim_context_vt', after = { 'nvim-treesitter', colorscheme } })
    use({
        'm-demare/hlargs.nvim',
        after = { 'nvim-treesitter' },
        config = function()
            require('rc/plugins/hlargs')
        end,
    })
    use({
        'romgrk/nvim-treesitter-context',
        after = {'nvim-treesitter'},
        cmd = { 'TSContextEnable' },
        config = function()
            require('rc/plugins/nvim-treesitter-context')
        end,
    })

    -- Textobject
    use({ 'nvim-treesitter/nvim-treesitter-textobjects', after = { 'nvim-treesitter' } })
    use({
        'David-Kunz/treesitter-unit',
        after = { 'nvim-treesitter' },
        config = function()
            require('rc/plugins/treesitter-unit')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- 検索
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'RRethy/vim-illuminate',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/vim-illuminate')
        end,
    })
    use({
        't9md/vim-quickhl',
        --event = 'VimEnter',
        config = function()
            vim.cmd('source ~/.config/nvim/rc/plugins/vim-quickhl.vim')
        end,
    })
    use({
        'kevinhwang91/nvim-hlslens',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/vim-hlslens')
        end,
    })
    use({
        'folke/todo-comments.nvim',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/todo-comments')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- 操作
    ----------------------------------------------------------------------------------------------------------------------------------
    --use({
    --    'tmhedberg/matchit',
    --    --event = 'VimEnter',
    --})
    --use({
    --    'Lokaltog/vim-easymotion',
    --    --event = 'VimEnter',
    --    config = function()
    --        vim.cmd('source ~/.config/nvim/rc/plugins/vim-easymotion.vim')
    --    end,
    --})
    use({
        'phaazon/hop.nvim',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/hop')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- UI
    ----------------------------------------------------------------------------------------------------------------------------------
    use ({
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        event = 'VimEnter',
        config = function()
            require('rc/plugins/nvim-tree')
        end,
    })
    use({
        'editorconfig/editorconfig-vim',
        --event = 'VimEnter',
    })
    use({
        'kyazdani42/nvim-web-devicons',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/nvim-web-devicons')
        end,
    })
    use({
        'osyo-manga/vim-over',
        --event = 'VimEnter',
        config = function()
            vim.cmd('source ~/.config/nvim/rc/plugins/vim-over.vim')
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/lualine')
        end,
    })
    use({
        'lukas-reineke/indent-blankline.nvim',
        --event = 'VimEnter',
        config = function()
            --require('rc/plugins/indent-blankline')
        end,
    })
    use({
        'petertriho/nvim-scrollbar',
        requires = { { 'kevinhwang91/nvim-hlslens', opt = true } },
        after = { colorscheme, 'nvim-hlslens' },
        config = function()
            require('rc/plugins/nvim-scrollbar')
        end,
    })
    use({
        'akinsho/bufferline.nvim',
        after = colorscheme,
        config = function()
            require('rc/plugins/bufferline')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Insert/Edit
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'junegunn/vim-easy-align',
        --event = 'VimEnter',
        config = function()
            vim.cmd('source ~/.config/nvim/rc/plugins/vim-easy-align.vim')
        end,
    })
    use({
        'windwp/nvim-autopairs',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/nvim-autopairs')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Yank
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'gbprod/yanky.nvim',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/yanky')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Operator
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'gbprod/substitute.nvim',
        --event = 'VimEnter',
        config = function()
            require('rc/plugins/substitute')
        end,
    })
    use({
        'machakann/vim-sandwich',
        --event = 'VimEnter',
        config = function()
            vim.cmd('source ~/.config/nvim/rc/plugins/vim-sandwich.vim')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Lint
    ----------------------------------------------------------------------------------------------------------------------------------
    -- まだ
    use({
        'jose-elias-alvarez/null-ls.nvim',
        after = 'nvim-lsp-installer',
        config = function()
            require('rc/plugins/null-ls')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Indent
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        '2072/PHP-Indenting-for-VIm',
        ft = { 'php' },
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- FileType
    ----------------------------------------------------------------------------------------------------------------------------------
    use({
        'jwalton512/vim-blade',
        ft = { 'php', 'blade', 'blade.php' },
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Markdown
    ----------------------------------------------------------------------------------------------------------------------------------
    --use({
    --    'skanehira/preview-markdown.vim',
    --    ft = { 'markdown' },
    --    config = function()
    --        vim.cmd('source ~/.config/nvim/rc/plugins/preview-markdown.vim')
    --    end,
    --})
    use({
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        ft = { 'markdown', 'pandoc.markdown', 'rmd' },
        config = function()
            vim.cmd('source ~/.config/nvim/rc/plugins/markdown-preview.vim')
        end,
    })

    ----------------------------------------------------------------------------------------------------------------------------------
    -- Misc
    ----------------------------------------------------------------------------------------------------------------------------------
    use({'dstein64/vim-startuptime'})
end)
