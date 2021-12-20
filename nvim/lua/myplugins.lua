local packer = require('packer')

packer.startup(function()
    use 'wbthomason/packer.nvim'

    use { 'goolord/alpha-nvim',                  config = require'plugins/misc/dashboard'.config, requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'lewis6991/gitsigns.nvim',             config = require'plugins/editor/gitsigns'.config, requires = { 'nvim-lua/plenary.nvim' } }
    use { 'folke/which-key.nvim',                config = require'plugins/misc/which-key'.config, keys = '<leader>' }
    use { 'windwp/nvim-autopairs',               config = require'plugins/editor/nvim-autopairs'.config }
    use { 'ethanholz/nvim-lastplace',            config = require'plugins/misc/nvim-lastplace'.config }
    use { 'ahmedkhalf/project.nvim',             config = require'plugins/misc/project'.config }
    use { 'folke/todo-comments.nvim',            config = require'plugins/editor/todo-comments'.config, requires = {"nvim-lua/plenary.nvim" }}
    use { 'numToStr/Comment.nvim',               config = require'plugins/editor/comment'.config }
    use { 'chentau/marks.nvim',                  config = require'plugins/editor/marks'.config }
    use { 'norcalli/nvim-colorizer.lua',         config = require'plugins/editor/colorizer'.config, cmd = {'ColorizerToggle'} }
    use { 'kyazdani42/nvim-tree.lua',            config = require'plugins/editor/nvim-tree'.config, requires = { 'kyazdani42/nvim-web-devicons'}, cmd = {"NvimTreeToggle"} }
    use { 'nvim-telescope/telescope.nvim',       config = require'plugins/misc/telescope'.config, requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'hoob3rt/lualine.nvim',                config = require'plugins/misc/lualine'.config, requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'akinsho/nvim-bufferline.lua',         config = require'plugins/misc/bufferline'.config }
    -- use { 'mhartington/formatter.nvim',       config = require'plugins/editor/formatter'.config }
    use { 'danymat/neogen',                      config = require'plugins/editor/neogen'.config, requires = "nvim-treesitter/nvim-treesitter", cmd = {"Neogen"} }
    use { 'lukas-reineke/indent-blankline.nvim', config = require'plugins/editor/indent-blankline'.config }
    use { 'mzlogin/vim-markdown-toc',            config = require'plugins/misc/markdown-toc'.config, cmd = { "GenTocGFM"} }
    use { 'rcarriga/vim-ultest',                 config = require'plugins/editor/ultest'.config, requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
    use { 'beauwilliams/focus.nvim',             config = require'plugins/editor/focus'.config }
    use { 'rcarriga/nvim-notify',                config = require'plugins/misc/notify'.config, event = "BufWinEnter" }
    use { 'nvim-treesitter/nvim-treesitter',     run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',          requires = {'nvim-treesitter/nvim-treesitter'}, cmd = {"TSPlaygroundToggle"} }
    use { 'jbyuki/venn.nvim',                    cmd = {'VBox', 'VBoxD', 'VBoxDO', 'VBoxH', 'VBoxHO', 'VBoxO'} }
    use { 'ellisonleao/glow.nvim',               cmd = {'Glow', 'GlowInstall'} }
    use { 'folke/zen-mode.nvim',                 cmd = { "ZenMode" } }
    use { 'junegunn/vim-easy-align',             cmd = { "EasyAlign" } }
    use { 'tweekmonster/startuptime.vim',        cmd = {"StartupTime"} }
    use { 'gyim/vim-boxdraw',                    ft = 'markdown'}
    use { 'ChristianChiarulli/vim-solidity',     ft = {'solidity', 'sol'}}
    use 'ntpeters/vim-better-whitespace'
    use 'inside/vim-search-pulse'
    -- use 'gpanders/editorconfig.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer'
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
    use { 'davidsierradz/cmp-conventionalcommits', ft = 'gitcommit' }
    use 'rafamadriz/friendly-snippets'
    use 'folke/lsp-colors.nvim'
    use 'b0o/SchemaStore.nvim'
    -- use { 'weilbith/nvim-code-action-menu', config = require'plugins/lsp/code-action'.config, cmd="CodeActionMenu" }
    use { 'jose-elias-alvarez/null-ls.nvim',   config = require'plugins/lsp/null-ls'.config, requires = 'nvim-lua/plenary.nvim'}
    use { 'tami5/lspsaga.nvim',                config = require'plugins/lsp/lspsaga'.config, requires = 'neovim/nvim-lspconfig' }

    -- WARN: Needs with Neovim 0.6 dependency
    -- use { "folke/trouble.nvim", config = require'plugins/lsp/trouble'.config, requires = "kyazdani42/nvim-web-devicons" }

    -- COLOR SCHEMES
    use {'tomasiser/vim-code-dark' }
    -- use {'rose-pine/neovim',}
    -- use {'lighthaus-theme/vim-lighthaus'}
    -- use {'projekt0n/github-nvim-theme'}
    -- use {'folke/tokyonight.nvim'}
end)

require'plugins/lsp/lsp-installer'.config()
require'plugins/lsp/treesitter'.config()

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
