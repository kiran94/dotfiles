local options = {}

options.config = function()
    local whichkey = require("which-key")
    local function cmd(command)
        return "<cmd>" .. command .. "<CR>"
    end

    local setupOpts = {
        plugins = {
            marks     = true,
            registers = true
        },
        icons = {
            breadcrumb = "»",
            separator  = "➜",
            group      = "+"
        }
    }

    local opts = {
        mode   = "n",
        prefix = "<leader>"
    }

    local mappings = {
        -- Quit
        q = {
            name = "+close",
            q = {":bd<CR>", "quit"},
            a = {":qa<CR>", "quit all"},
            w = {":wq!<CR>", "write and quit"},
            Q = {":q!<CR>", "force quit"},
            s = {":SSave<CR>", "save session"}
        },
        -- Window Management
        w = {
            name  = "+windows",
            h     = {"<C-W>h", "left"},
            j     = {"<C-W>j", "below"},
            l     = {"<C-W>l", "right"},
            k     = {"<C-W>k", "up"},
            w     = {":w<cr>", "write file"},
            H     = {cmd("windo wincmd H"), "horizontal rotate"}, -- or <C-w>t<C-w>H
            V     = {cmd("windo wincmd K"), "vertical rotate"},   -- or <C-w>t<C-w>K
            ["+"] = {cmd("vsplit"), "vertical split"},
            ["-"] = {cmd("split"), "split"},
            ["m"] = {cmd("FocusMaximise"), "maximize"},
            ["="] = {"<C-W>=", "balance"}
        },
        -- Buffer Management
        b = {
            name = "+buffer",
            t    = {cmd("tabnew"), "tab new"},
            r    = {cmd("reg"), "registers"},
            m    = {cmd("marks"), "marks"},
            mt   = {cmd("SignatureToggleSigns"), "toggle marks"},
        },
        -- Special
        z = {
            name  = "+special",
            ["#"] = {cmd("ColorizerToggle"), "color toggle"},
            p = {
                name = "+packer",
                i    = {cmd("PackerSync"), "packer sync"},
                c    = {cmd("PackerCompile"), "packer compile"},
                r    = {cmd("PackerClean"), "packer clean"}
            },
            z  = {cmd("ZenMode"), "zen mode"}
        },
        -- Code
        c = {
            name = "+code",
            w = {
                name = "+whitespace",
                s    = {cmd("StripWhitespace"), "strip whitespace"},
                w    = {cmd("ToggleWhitespace"), "whitespace toggle"},
                i    = {cmd("set list!"), "indentation toggle"},
            },
            -- a = {cmd("lua vim.lsp.buf.code_action()"), "action"},
            a = {cmd("CodeActionMenu"), "action"},
            f = {cmd("Format"), "format"},
            d = {cmd("Neogen"), "generate docs"},
            r = {
                r = {cmd("lua vim.lsp.buf.references()"), "references"},
                n = {cmd("lua vim.lsp.buf.rename()"), "rename"}
            },
            g = {
                name = "+git",
                d = {cmd("Gitsigns toggle_linehl"), "toggle diff"},
                b = {cmd("Gitsigns blame_line"), "blame line"},
            },
            t = {
                name = "+test",
                n    = {cmd('UltestNearest'), "test nearest"},
                l    = {cmd('UltestLast'), "test last"},
                d    = {cmd('UltestDebugNearest'), "debug nearest test"},
                a    = {cmd('Ultest'), "all tests"},
                o    = {cmd('UltestOutput'), "test output"},
            }
        },
        -- Explorer
        e = {
            name = "+explorer",
            e    = {":NvimTreeToggle<CR>", "file explorer"},
            t    = {cmd('UltestSummary'), "test explorer"},
        },
        -- Go
        g = {
            name = "+go",
            d    = {cmd("lua vim.lsp.buf.definition()"), "definition"},
            D    = {cmd("lua vim.lsp.buf.declaration()"), "declaration"}
        },
        t = {
            name = "+terminal",
            z    = { cmd(":new term://zsh"), 'zsh' }
        }
    }

    whichkey.setup(setupOpts)
    whichkey.register(mappings, opts)
end

-- Lsp Mappings
vim.cmd [[
  nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> L <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> ] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <silent> [ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
]]

return options
