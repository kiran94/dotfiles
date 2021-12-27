--------------------------
-- SETTINGS
--------------------------

local set = vim.opt
set.encoding       = "utf-8"
set.spell          = false               -- no spelling, use lsp for this
set.number         = true
set.relativenumber = true                -- add line numbers and enable relative
set.splitbelow     = true                -- split down with :split
set.splitright     = true                -- split right with :vsplit
set.confirm        = true
set.backspace      = "indent,eol,start"
set.ffs            = "unix,dos,mac"      -- file line endings when trying to open, close files
set.smartcase      = true                -- search with no casing when casing in the search string is detected
set.hlsearch       = true                -- highlight search
set.incsearch      = true                -- highlight as typing search term
set.showmatch      = true                -- when brace is inserted, briefly jump to matching
set.tm             = 500                 -- set timeout for keyboard sequences
set.autoread       = true                -- when the file has been changed outside of vim, read the file in
set.ruler          = true                -- line number and column position shown in the bottom bar
set.hidden         = true                -- when a hidden buffer is abandoned, drop it
set.history        = 1000                -- history when searching through commands
set.signcolumn     = "yes"               -- show the sign column on the left, for git changes for example
set.lazyredraw     = true                -- when executing macros, don't redraw the screen
set.mouse          = "nv"                -- enable mouse
set.tabstop        = 4                   -- one tab = 4 spaces
set.shiftwidth     = 4                   -- shift tab = 4
set.expandtab      = true                -- when a tab is inserted, use spaces
set.smarttab       = true                -- when a tab is inserted, use spaces?
set.backup         = false               -- no backup files
set.writebackup    = false               -- no write backup
set.swapfile       = false               -- no swap files
set.termguicolors  = true                -- set 24-bit colors
set.clipboard      = "unnamedplus"       -- allow pasting from external programs
set.wrap           = false               -- don't word wrap
set.scrolloff      = 8                   -- scroll before you hit the bottom of the screen
set.path           = "**"                -- path used when running certain commands like gf
set.report         = 0                   -- always report the number of lines yanked
set.shortmess      = "a"
set.cmdheight      = 2
set.updatetime     = 300
set.spell          = false
set.spelllang      = { 'en_gb' }
set.virtualedit    = "block"

--------------------------
-- FOLD SETTINGS
--------------------------
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable  = false
vim.opt.foldnestmax = 1

vim.cmd[[ highlight clear SignColumn ]]
vim.api.nvim_command('autocmd FileType markdown set wrap')

vim.g.python_host_prog  = "/usr/bin/python2"
vim.g.python3_host_prog = "/usr/bin/python3"

set.wildmenu            = true
set.wildignore          = "*/tmp/*,*.so,*.swp,*.zip,/.git,*/bin/*,*/obj/*,*egg-info*,htmlcov/*,*/node_modules/*" -- MacOSX/Linux
-- set.wildignore = vim.opt.wildignore .. "*\\tmp\\*,*.swp,*.zip,*.exe,\\.git,*/bin/*,*/obj/*,*egg-info*,htmlcov/*,*/node_modules/*" -- Windows

vim.cmd[[ autocmd BufNewFile,BufRead .eslintrc set ft=json ]]
vim.cmd[[ autocmd BufNewFile,BufRead .babelrc set ft=json ]]
-- vim.cmd[[ autocmd BufNewFile,BufRead requirements*.txt set syntax=python ]]
