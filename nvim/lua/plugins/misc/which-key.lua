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
                s    = {cmd("PackerSync"), "packer sync"},
                i    = {cmd("PackerInstall"), "packer install"},
                c    = {cmd("PackerCompile") .. cmd("echo 'compiled!'"), "packer compile"},
                r    = {cmd("PackerClean"), "packer clean"},
                x    = {cmd("lua require('packer').snapshot()"), "packer snapshot"}
            },
            m = {
                name = '+markdown',
                t = {cmd('EasyAlign*<Bar>'), "format markdown table"},
                g = {cmd('GenTocGFM'), "create markdown toc"},
                b = {cmd('VBox'), "create box or line"},
                p = {cmd('Glow'), "preview"},
                s = {':MaimMarkdown<space>', "screenshot"},
            },
            z = {cmd("ZenMode"), "zen mode"},
            t = {cmd(":new term://zsh"), 'terminal' },
            d = {cmd("TroubleToggle"), 'diagnostics' }
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
            -- a = {cmd("CodeActionMenu"), "action"},
            a = {cmd("Lspsaga code_action"), "action"},
            -- f = {cmd("Format"), "format"},
            f = {cmd("lua vim.lsp.buf.formatting()"), "format"},
            d = {cmd("Neogen"), "generate docs"},
            r = {
                name = '+refactor',
                -- n = {cmd("lua vim.lsp.buf.rename()"), "rename"}
                n = {cmd("Lspsaga rename"), "rename"},
                r = {cmd("lua vim.lsp.buf.references()"), "references"},
            },
            g = {
                name = "+git",
                l = {cmd("Gitsigns toggle_linehl"), "line diff"},
                d = {cmd("DiffviewOpen"), "diff view"},
                b = {cmd("Gitsigns blame_line"), "blame line"},
            },
            t = {
                name = "+test",
                n    = {cmd('lua require("neotest").run.run()'), "test nearest"},
                d    = {cmd('require("neotest").run.run({strategy = "dap"})'), "debug nearest test"},
                a    = {cmd('require("neotest").run.run(vim.fn.expand("%"))'), "all current file tests"},
            },
            m = {
                name = "+modify",
                s    = { cmd("ISwap"), "swap" }
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
        }
    }

    whichkey.setup(setupOpts)
    whichkey.register(mappings, opts)
end

-- Lsp Mappings
-- nnoremap <silent> L <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
-- nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
vim.cmd [[
  " nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>
  nnoremap <silent> L <cmd>Lspsaga show_line_diagnostics<CR>
  nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> ] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
  nnoremap <silent> [ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

  vnoremap <silent> <leader>zmt :EasyAlign*<Bar><CR>
  vnoremap <silent> <leader>zmb :VBox<CR>
]]

return options
