--------------------
-- BOOTSTRAP
-------------------
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

--------------------
-- PLUGINS
-------------------

require("lazy").setup({
    { 'lewis6991/gitsigns.nvim',                   config   = require'plugins/editor/gitsigns'.config, dependencies = { 'nvim-lua/plenary.nvim' }, event = "BufWinEnter" },
    { 'goolord/alpha-nvim',                        config   = require'plugins/misc/dashboard'.config, dependencies = { 'kyazdani42/nvim-web-devicons' } },
    { 'numToStr/Comment.nvim',                     config   = require'plugins/editor/comment'.config, event = "BufWinEnter" },
    { 'folke/which-key.nvim',                      config   = require'plugins/misc/which-key'.config, keys = '<leader>' },
    { 'windwp/nvim-autopairs',                     config   = require'plugins/editor/nvim-autopairs'.config, event = "BufWinEnter" },
    { 'ethanholz/nvim-lastplace',                  config   = require'plugins/misc/nvim-lastplace'.config },
    { 'ahmedkhalf/project.nvim',                   config   = require'plugins/misc/project'.config, event = "BufWinEnter" },
    { 'nvim-lualine/lualine.nvim',                 config   = require'plugins/misc/lualine'.config, dependencies = {'kyazdani42/nvim-web-devicons', lazy = true} },
    { 'folke/todo-comments.nvim',                  config   = require'plugins/editor/todo-comments'.config, dependencies = {"nvim-lua/plenary.nvim" }, event = "BufWinEnter"},
    { 'numToStr/Comment.nvim',                     config   = require'plugins/editor/comment'.config, event = "BufWinEnter" },
    { 'chentoast/marks.nvim',                      config   = require'plugins/editor/marks'.config, event = "BufWinEnter"},
    { 'norcalli/nvim-colorizer.lua',               config   = require'plugins/editor/colorizer'.config, cmd = {'ColorizerToggle'} },
    { 'kyazdani42/nvim-tree.lua',                  config   = require'plugins/editor/nvim-tree'.config, dependencies = { 'kyazdani42/nvim-web-devicons'}, cmd = {"NvimTreeToggle"} },
    { 'nvim-telescope/telescope.nvim',             config   = require'plugins/misc/telescope'.config, dependencies = { {'nvim-lua/plenary.nvim'} }, event = "BufWinEnter" },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim',  build = 'make' },
    { "ur4ltz/surround.nvim",                      config   = require'plugins/editor/surround'.config, event = "BufWinEnter" },
    { 'akinsho/bufferline.nvim',                   config   = require'plugins/misc/bufferline'.config, event = "BufWinEnter" },
    { 'danymat/neogen',                            config   = require'plugins/editor/neogen'.config, dependencies = "nvim-treesitter/nvim-treesitter", cmd = {"Neogen"} },
    { 'lukas-reineke/indent-blankline.nvim',       config   = require'plugins/editor/indent-blankline'.config },
    { 'mzlogin/vim-markdown-toc',                  config   = require'plugins/misc/markdown-toc'.config, cmd = { "GenTocGFM"} },
    { 'rcarriga/nvim-notify',                      config   = require'plugins/misc/notify'.config, event = "BufWinEnter" },
    { 'kevinhwang91/nvim-hlslens',                 config   = require'plugins/editor/hlslens'.config },
    { 'akinsho/git-conflict.nvim',                 config   = require'plugins/misc/git_conflict'.config, event = "BufWinEnter" },
    { 'nvim-treesitter/nvim-treesitter',           config   = require'plugins/lsp/treesitter'.config, build = ':TSUpdate' },
    { 'nvim-treesitter/playground',                dependencies = {'nvim-treesitter/nvim-treesitter'}, cmd = {"TSPlaygroundToggle"} },
    { 'sindrets/diffview.nvim',                    dependencies = 'nvim-lua/plenary.nvim', cmd = { "DiffviewOpen" } },
    { 'jbyuki/venn.nvim',                          cmd      = {'VBox', 'VBoxD', 'VBoxDO', 'VBoxH', 'VBoxHO', 'VBoxO'} },
    { 'ellisonleao/glow.nvim',                     cmd      = {'Glow', 'GlowInstall'} },
    { 'folke/zen-mode.nvim',                       cmd      = { "ZenMode" } },
    { 'junegunn/vim-easy-align',                   cmd      = { "EasyAlign" } },
    { 'tweekmonster/startuptime.vim',              cmd      = {"StartupTime"} },
    { 'gyim/vim-boxdraw',                          ft       = 'markdown'},
    { 'ntpeters/vim-better-whitespace',            event    = "BufWinEnter" },
    { 'inside/vim-search-pulse',                   event    = "BufWinEnter" },
    { 'dstein64/nvim-scrollview',                  event    = "BufWinEnter" },
    { 'mizlan/iswap.nvim',                         event    = "BufWinEnter", dependencies = "nvim-treesitter/nvim-treesitter" },
    { 'folke/twilight.nvim',                       event    = "BufWinEnter", dependencies = {"nvim-treesitter/nvim-treesitter", "folke/zen-mode.nvim"}, config = require'plugins/misc/zen'.twilight_config },
    { 'stevearc/dressing.nvim',                    config   = require'plugins/misc/dressing'.config },
    { 'gpanders/editorconfig.nvim'},
    -- { 'beauwilliams/focus.nvim',                config   = require'plugins/editor/focus'.config, event = "BufWinEnter" },
    { "iamcco/markdown-preview.nvim",              config   = require'plugins/misc/markdown-preview'.config, build = function() vim.fn["mkdp#util#install"]() end, ft = { "markdown" } },
    { 'Bryley/neoai.nvim',                         config = function() require("neoai").setup() end, dependencies = { "MunifTanjim/nui.nvim", } },

    { "nvim-neotest/neotest", config = require'plugins/editor/ultest'.config, event="BufWinEnter", dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-plenary",
        },
    },

     -- https://github.com/Bryley/neoai.nvim/issues/13
     -- { 'beauwilliams/focus.nvim', config = function() require("focus").setup({}) end, event = "BufWinEnter" },

    -- COLOR SCHEMES
    {'Mofiqul/vscode.nvim', lazy=false},
    -- use {'tomasiser/vim-code-dark' }
    -- use {'rose-pine/neovim',}
    -- use {'lighthaus-theme/vim-lighthaus'}
    -- use {'projekt0n/github-nvim-theme'}
    -- use {'folke/tokyonight.nvim'}

    { 'kiran94/s3edit.nvim', config = function() require('s3edit').setup() end},
    { 'kiran94/maim.nvim',   config = function() require('maim').setup() end },

    --------------------
    -- LSP
    -------------------

    {'neovim/nvim-lspconfig', config = require'plugins/lsp/lsp-installer'.config, event="BufWinEnter", dependencies = {
        "onsails/lspkind-nvim",
        "ray-x/lsp_signature.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- TODO: Move CMP into it's own config
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua", -- ft = lua
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "davidsierradz/cmp-conventionalcommits", -- ft = gitcommit

        "rafamadriz/friendly-snippets",
        "folke/lsp-colors.nvim",
        "b0o/SchemaStore.nvim",
        "RRethy/vim-illuminate",
        'Afourcat/treesitter-terraform-doc.nvim',
        'j-hui/fidget.nvim',
        'lvimuser/lsp-inlayhints.nvim',
    } },

    {"jose-elias-alvarez/null-ls.nvim", config = require"plugins/lsp/null-ls".config, dependencies = "nvim-lua/plenary.nvim"},
    {"tami5/lspsaga.nvim",              config = require"plugins/lsp/lspsaga".config, dependencies = "neovim/nvim-lspconfig", cmd = "Lspsaga" },
    {"folke/trouble.nvim",              config = require"plugins/lsp/trouble".config, dependencies = "kyazdani42/nvim-web-devicons", cmd = "TroubleToggle" },
    {"ThePrimeagen/refactoring.nvim",   config = require"plugins/lsp/refactoring".config, requires = { {"nvim-lua/plenary.nvim"}, {"nvim-treesitter/nvim-treesitter"} }, event = "BufWinEnter" },
    {"SmiteshP/nvim-navic",             config = require'plugins/lsp/navic'.config, requires = "neovim/nvim-lspconfig"},
    -- { 'joechrisellis/lsp-format-modifications.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

    { 'VonHeikemen/fine-cmdline.nvim', dependencies = { {'MunifTanjim/nui.nvim'} }, config = function()
        require('fine-cmdline').setup({})
        vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end},

    --------------------
    -- DAP
    -------------------
    { "mfussenegger/nvim-dap", },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },
    { "leoluz/nvim-dap-go", dependencies = {"mfussenegger/nvim-dap"} },
    { "theHamsta/nvim-dap-virtual-text", dependencies = {"mfussenegger/nvim-dap"} },
    -- { 'mfussenegger/nvim-dap-python', dependencies = {'mfussenegger/nvim-dap'} },
    -- require'plugins/lsp/dap'


    --------------------
    -- OLD
    -------------------
    -- { "AckslD/nvim-neoclip.lua",          config = require'plugins/misc/neoclip'.config, dependencies = { 'nvim-telescope/telescope.nvim'} },
    -- { 'mhartington/formatter.nvim',       config = require'plugins/editor/formatter'.config },
    -- { 'ChristianChiarulli/vim-solidity',  ft = {'solidity', 'sol' }},
    -- { 'nkakouros-original/numbers.nvim',  config = require'plugins/editor/numbers'.config, event = "BufWinEnter" },
    -- { "folke/noice.nvim", config = require'./plugins/misc/noice'.config, requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", }, },
})

--------------------
-- BUILT IN PLUGINS
-------------------
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
