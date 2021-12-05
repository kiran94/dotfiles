local options = {}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

options.config = function()
    local whichkey = require('which-key')
    local function cmd(command)
        return "<cmd>" .. command .. "<CR>"
    end

    local setupOpts = {
        plugins = {
            marks = true,
            registers = true,
        },
        icons = {
            breadcrumb = "»",
            separator = "➜",
            group = "+",
        }
    }

    local opts = {
        mode = "n",
        prefix = "<leader>"
    }

    local mappings = {
        -- Quit
        q = {
            name = "+close",
            q = { ':bd<CR>', 'quit' },
            a = { ':qa<CR>', 'quit all' },
            w = { ':wq!<CR>', 'write and quit' },
            Q = { ':q!<CR>', 'force quit' },
            s = { ':SSave<CR>', 'save session' },
        },
        -- Window Management
        w = {
           name = "+windows",
           h     = {'<C-W>h',              'left'},
           j     = {'<C-W>j',              'below'},
           l     = {'<C-W>l',              'right'},
           k     = {'<C-W>k',              'up'},
           w     = {':w<cr>',              'write file'},
           H     = { cmd('windo wincmd H'), 'horizontal rotate'},
           V     = { cmd('windo wincmd K'), 'vertical rotate'},
           ['+'] = { cmd("vsplit"),        "vertical split"},
           ['-'] = { cmd("split"),         "split"},
           ['='] = { "<C-W>=",             "balance"},
        },
        -- Buffer Management
        b = {
            name = "+buffer",
            t    = {cmd('tabnew'),               'tab new'},
            r    = {cmd('reg'),                  'registers'},
            m    = {cmd('marks'),                'marks'},
            mt   = {cmd('SignatureToggleSigns'), 'toggle marks'},
        },
        -- Special
        z = {
            name = "+special",
            ['#'] = { cmd('ColorizerToggle'), 'color toggle' },
            p = {
                name = "+packer",
                i    = { cmd('PackerSync'), 'packer sync' },
                c    = { cmd('PackerCompile'), 'packer compile' },
                r    = { cmd('PackerClean'), 'packer clean' },
            },
        },
        -- Code
        c = {
            name = '+code',
            w = {
                name = '+whitespace',
                s    = { cmd('StripWhitespace'), 'strip whitespace' },
                w    = { cmd('ToggleWhitespace'), 'whitespace toggle' },
            },
            a  = { cmd("lua vim.lsp.buf.code_action()") , "action" },
            r = {
                r = { cmd("lua vim.lsp.buf.references()") , "references" },
                n = { cmd("lua vim.lsp.buf.rename()") , "rename" },
            }
        },
        -- Explorer
        e = {
            e = {":NvimTreeToggle<CR>", 'explorer'}
        },
        -- Go
        g = {
            name = '+go',
            d    = { cmd("lua vim.lsp.buf.definition()") , "definition" },
            D    = { cmd("lua vim.lsp.buf.declaration()") , "declaration" },
        }
    }

    whichkey.setup(setupOpts)
    whichkey.register(mappings, opts)
end

-- Lsp Mappings
vim.cmd[[
  nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> L <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> ] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <silent> [ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

]]

return options
