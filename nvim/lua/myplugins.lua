local packer = require('packer')

packer.startup(function()
    use 'wbthomason/packer.nvim'

    use { 'goolord/alpha-nvim',                  config = require'plugins/misc/dashboard'.config, requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'lewis6991/gitsigns.nvim',             config = require'plugins/editor/gitsigns'.config, requires = { 'nvim-lua/plenary.nvim' }, event = "BufWinEnter" }
    use { 'folke/which-key.nvim',                config = require'plugins/misc/which-key'.config, keys = '<leader>' }
    use { 'windwp/nvim-autopairs',               config = require'plugins/editor/nvim-autopairs'.config, event = "BufWinEnter" }
    use { 'ethanholz/nvim-lastplace',            config = require'plugins/misc/nvim-lastplace'.config }
    use { 'ahmedkhalf/project.nvim',             config = require'plugins/misc/project'.config, event = "BufWinEnter" }
    use { 'nvim-lualine/lualine.nvim',           config = require'plugins/misc/lualine'.config, requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'folke/todo-comments.nvim',            config = require'plugins/editor/todo-comments'.config, requires = {"nvim-lua/plenary.nvim" }, event = "BufWinEnter"}
    use { 'numToStr/Comment.nvim',               config = require'plugins/editor/comment'.config, event = "BufWinEnter" }
    use { 'chentoast/marks.nvim',                config = require'plugins/editor/marks'.config, event = "BufWinEnter"}
    use { 'norcalli/nvim-colorizer.lua',         config = require'plugins/editor/colorizer'.config, cmd = {'ColorizerToggle'} }
    use { 'kyazdani42/nvim-tree.lua',            config = require'plugins/editor/nvim-tree'.config, requires = { 'kyazdani42/nvim-web-devicons'}, cmd = {"NvimTreeToggle"} }
    use { 'nvim-telescope/telescope.nvim',       config = require'plugins/misc/telescope'.config, requires = { {'nvim-lua/plenary.nvim'} }, event = "BufWinEnter" }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { "ur4ltz/surround.nvim",                config = require'plugins/editor/surround'.config, event = "BufWinEnter" }
    use { 'akinsho/bufferline.nvim',             config = require'plugins/misc/bufferline'.config, event = "BufWinEnter" }
    use { 'danymat/neogen',                      config = require'plugins/editor/neogen'.config, requires = "nvim-treesitter/nvim-treesitter", cmd = {"Neogen"} }
    use { 'lukas-reineke/indent-blankline.nvim', config = require'plugins/editor/indent-blankline'.config }
    use { 'mzlogin/vim-markdown-toc',            config = require'plugins/misc/markdown-toc'.config, cmd = { "GenTocGFM"} }
    use { "nvim-neotest/neotest",                config = require'plugins/editor/ultest'.config, requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim" } }
    use { 'nvim-neotest/neotest-python' }
    use { 'kiran94/maim.nvim',                   config = function() require('maim').setup() end }
    use { 'beauwilliams/focus.nvim',             config = require'plugins/editor/focus'.config, event = "BufWinEnter" }
    use { 'rcarriga/nvim-notify',                config = require'plugins/misc/notify'.config, event = "BufWinEnter" }
    use { 'kevinhwang91/nvim-hlslens',           config = require'plugins/editor/hlslens'.config }
    -- use { 'nkakouros-original/numbers.nvim',  config = require'plugins/editor/numbers'.config, event = "BufWinEnter" }
    use { 'akinsho/git-conflict.nvim',           config = require'plugins/misc/git_conflict'.config, event = "BufWinEnter" }
    use { 'nvim-treesitter/nvim-treesitter',     config = require'plugins/lsp/treesitter'.config, run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',          requires = {'nvim-treesitter/nvim-treesitter'}, cmd = {"TSPlaygroundToggle"} }
    use { 'sindrets/diffview.nvim',              requires = 'nvim-lua/plenary.nvim', cmd = { "DiffviewOpen" } }
    use { 'jbyuki/venn.nvim',                    cmd = {'VBox', 'VBoxD', 'VBoxDO', 'VBoxH', 'VBoxHO', 'VBoxO'} }
    use { 'ellisonleao/glow.nvim',               cmd = {'Glow', 'GlowInstall'} }
    use { 'folke/zen-mode.nvim',                 cmd = { "ZenMode" } }
    use { 'junegunn/vim-easy-align',             cmd = { "EasyAlign" } }
    use { 'tweekmonster/startuptime.vim',        cmd = {"StartupTime"} }
    use { 'gyim/vim-boxdraw',                    ft = 'markdown'}
    use { 'ntpeters/vim-better-whitespace',      event = "BufWinEnter" }
    use { 'inside/vim-search-pulse',             event = "BufWinEnter" }
    use { 'dstein64/nvim-scrollview',            event = "BufWinEnter" }
    use { 'mizlan/iswap.nvim',                   event = "BufWinEnter", requires = "nvim-treesitter/nvim-treesitter" }
    use { 'folke/twilight.nvim',                 event = "BufWinEnter", requires = {"nvim-treesitter/nvim-treesitter", "folke/zen-mode.nvim"}, config = require'plugins/misc/zen'.twilight_config }
    use 'gpanders/editorconfig.nvim'
--   use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", config = require'plugins/misc/markdown-preview', ft = { "markdown" } }

    -- LSP
    use {'neovim/nvim-lspconfig', config = require'plugins/lsp/lsp-installer'.config() }
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use {"williamboman/mason.nvim"}
    use {'williamboman/mason-lspconfig.nvim'}
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use { 'hrsh7th/cmp-nvim-lua', ft = 'lua' }
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use { 'davidsierradz/cmp-conventionalcommits', ft = 'gitcommit' }
    use 'rafamadriz/friendly-snippets'
    use 'folke/lsp-colors.nvim'
    use 'b0o/SchemaStore.nvim'
    use { 'jose-elias-alvarez/null-ls.nvim', config = require'plugins/lsp/null-ls'.config, requires = 'nvim-lua/plenary.nvim'}
    use { 'tami5/lspsaga.nvim',              config = require'plugins/lsp/lspsaga'.config, requires = 'neovim/nvim-lspconfig', cmd = 'Lspsaga' }
    use { "folke/trouble.nvim",              config = require'plugins/lsp/trouble'.config, requires = "kyazdani42/nvim-web-devicons", cmd = "TroubleToggle" }
    use { "ThePrimeagen/refactoring.nvim",   config = require'plugins/lsp/refactoring'.config, requires = { {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"} }, event = "BufWinEnter" }
    use { "RRethy/vim-illuminate"}
    use { 'Afourcat/treesitter-terraform-doc.nvim' }
    use { 'j-hui/fidget.nvim' }
    use { "SmiteshP/nvim-navic", config = require'plugins/lsp/navic'.config, requires = "neovim/nvim-lspconfig"}
    -- use { 'weilbith/nvim-code-action-menu',  config = require'plugins/lsp/code-action'.config, cmd="CodeActionMenu" }

    -- DAP
    use { 'mfussenegger/nvim-dap'}
    use { 'rcarriga/nvim-dap-ui', requires = {"mfussenegger/nvim-dap"} }
    use { 'leoluz/nvim-dap-go', requires = {"mfussenegger/nvim-dap"} }
    use { 'theHamsta/nvim-dap-virtual-text', requires = {"mfussenegger/nvim-dap"} }
    -- use { 'mfussenegger/nvim-dap-python', requires = {'mfussenegger/nvim-dap'} }


    -- COLOR SCHEMES
    use {'Mofiqul/vscode.nvim'}
    -- use {'tomasiser/vim-code-dark' }
    -- use {'rose-pine/neovim',}
    -- use {'lighthaus-theme/vim-lighthaus'}
    -- use {'projekt0n/github-nvim-theme'}
    -- use {'folke/tokyonight.nvim'}

    -- OLD
    -- use { "AckslD/nvim-neoclip.lua",          config = require'plugins/misc/neoclip'.config, requires = { 'nvim-telescope/telescope.nvim'} }
    -- use { 'mhartington/formatter.nvim',       config = require'plugins/editor/formatter'.config }
    -- use { 'ChristianChiarulli/vim-solidity',  ft = {'solidity', 'sol' }}
end)

require'plugins/lsp/dap'

-- Automatically Compile Packer when this file changes
vim.cmd[[
augroup packer_user_config
  autocmd!
  autocmd BufWritePost myplugins.lua source <afile> | PackerCompile
augroup end
]]

-- Built In Plugins
vim.g.loaded_gzip         = 1
vim.g.loaded_tar          = 1
vim.g.loaded_tarPlugin    = 1
vim.g.loaded_zipPlugin    = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw        = 0
vim.g.loaded_netrwPlugin  = 0
vim.g.loaded_matchit      = 1
vim.g.loaded_matchparen   = 1
vim.g.loaded_spec         = 1
