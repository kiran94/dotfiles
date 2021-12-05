local packer = require('packer')

packer.startup(function()
    use 'wbthomason/packer.nvim'

    use { 'goolord/alpha-nvim',              config = require'plugins/misc/dashboard'.config, requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'lewis6991/gitsigns.nvim',         config = require'plugins/editor/gitsigns'.config, requires = { 'nvim-lua/plenary.nvim' } }
    use { 'folke/which-key.nvim',            config = require'plugins/misc/which-key'.config }
    use { 'windwp/nvim-autopairs',           config = require'plugins/editor/nvim-autopairs'.config }
    use { 'ethanholz/nvim-lastplace',        config = require'plugins/misc/nvim-lastplace'.config}
    use { 'ahmedkhalf/project.nvim',         config = require'plugins/misc/project'.config }
    use { 'folke/todo-comments.nvim',        config = require'plugins/editor/todo-comments'.config, requires = {"nvim-lua/plenary.nvim" }}
    use { 'numToStr/Comment.nvim',           config = require'plugins/editor/comment'.config }
    use { 'chentau/marks.nvim',              config = require'plugins/editor/marks'.config }
    use { 'norcalli/nvim-colorizer.lua',     config = require'plugins/editor/colorizer'.config }
    use { 'kyazdani42/nvim-tree.lua',        config = require'plugins/editor/nvim-tree'.config, requires = { 'kyazdani42/nvim-web-devicons'} }
    use { 'nvim-telescope/telescope.nvim',   config = require'plugins/misc/telescope'.config, requires = { {'nvim-lua/plenary.nvim'} } }
    use { 'hoob3rt/lualine.nvim',            config = require'plugins/misc/lualine'.config, requires = {'kyazdani42/nvim-web-devicons', opt = true} }
    use { 'akinsho/nvim-bufferline.lua',     config = require'plugins/misc/bufferline'.config }
    use { 'mhartington/formatter.nvim',      config = require'plugins/editor/formatter'.config }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use "ntpeters/vim-better-whitespace"
    use "inside/vim-search-pulse"
    use 'junegunn/vim-easy-align'
    use 'mzlogin/vim-markdown-toc'
    use 'gpanders/editorconfig.nvim'

    -- Lua
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-emoji'
    use 'davidsierradz/cmp-conventionalcommits'
    use 'rafamadriz/friendly-snippets'
    use 'ray-x/lsp_signature.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'folke/lsp-colors.nvim'
    -- use { "folke/trouble.nvim", config = require'plugins/lsp/trouble'.config, requires = "kyazdani42/nvim-web-devicons" }

    -- Color Schemes
    use 'tomasiser/vim-code-dark'
    use 'lighthaus-theme/vim-lighthaus'
    use 'projekt0n/github-nvim-theme'
    use 'folke/tokyonight.nvim'
end)

require'plugins/lsp/lsp-installer'.config()
require'plugins/lsp/treesitter'.config()
