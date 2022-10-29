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
            ["t"] = {cmd("FocusToggle"), "toggle"},
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
        f = {
            name = '+fuzzy',
            f    = { function() require('telescope.builtin').find_files(require('telescope.themes').get_ivy({hidden=true})) end,      "Find Files" },
            t    = { function() require('telescope.builtin').treesitter(require('telescope.themes').get_ivy({hidden=true})) end,      "Tresitter" },
            g    = { function() require('telescope.builtin').live_grep(require('telescope.themes').get_ivy({hidden=true})) end,       "Grep" },
            c    = { function() require('telescope.builtin').git_commits(require('telescope.themes').get_ivy({hidden=true})) end,     "Git Commits" },
            r    = { function() require('telescope.builtin').command_history(require('telescope.themes').get_ivy({hidden=true})) end, "Command History" },
            b    = { function() require('telescope.builtin').buffers(require('telescope.themes').get_ivy({hidden=true})) end,         "Buffers" },
            h    = { function() require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({hidden=true})) end,       "Help Tags" },
            e    = {
                name = '+external',
                s    = { function() require('s3edit').edit() end,       "S3" },
            },
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
                e = {function() _G.edit_cell() end, "edit cell"},
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
            f = {cmd("lua vim.lsp.buf.format({ async = true })"), "format"},
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
                b = {cmd("Gitsigns blame_line"), "blame line"},
                d = {
                    name = "+diff",
                    o    = {cmd("DiffviewOpen"), "diff open"},
                    c    = {cmd("DiffviewClose"), "diff close"},
                    r    = {cmd("DiffviewRefresh"), "diff refresh"},
                },
            },
            t = {
                name = "+test",
                n    = {cmd('lua require("neotest").run.run()'), "test nearest"},
                d    = {cmd('lua require("neotest").run.run({strategy = "dap"})'), "debug nearest test"},
                a    = {cmd('lua require("neotest").run.run(vim.fn.expand("%"))'), "all current file tests"},
                s    = {cmd('lua require("neotest").summary.toggle()'), "summary"},
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
            t    = {cmd('lua require("neotest").summary.toggle()'), "summary"},
        },
        -- Go
        g = {
            name = "+go",
            d = {cmd("lua vim.lsp.buf.definition()"), "definition"},
            D = {cmd("lua vim.lsp.buf.declaration()"), "declaration"},
            r = {cmd("lua vim.lsp.buf.references()"), "references"},
        },
        -- Debug
        d = {
            name = "+hello",
            b = { cmd("lua require'dap'.toggle_breakpoint()"), "Toggle Breakpoint" },
            B = { cmd("lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))"), "Conditional Breakpoint" },
            l = { cmd("lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))"), "Log Point"},
            c = { cmd("lua require'dap'.continue()"), "Continue" },
            C = { cmd("lua require'dap'.run_to_cursor()"), "Run To Cursor" },
            i = { cmd("lua require'dap'.step_into()"), "Step Into" },
            n = { cmd("lua require'dap'.step_over()"), "Step Over (Next)" },
            u = { cmd("lua require'dap'.step_out()"), "Step Out" },
            p = { cmd("lua require'dap'.pause()"), "Pause" },
            r = { cmd("lua require'dap'.repl.toggle()"), "Toggle Repl" },
            s = { cmd("lua require'dap'.continue()"), "Start" },
            -- q = { cmd("lua require'dap'.close()"), "Quit" },
            U = { cmd("lua require'dapui'.toggle()"), "Toggle UI" },
            q = { ":DapTerminate<CR>", "Terminate" },
            t    = {cmd('lua require("neotest").run.run({strategy = "dap"})'), "debug test"},
            -- b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            -- d = { cmd("lu>a require'dap'.disconnect()"), "Disconnect" },
            -- g = { cmd("lua require'dap'.session()"), "Get Session" },
            z = {
                name= "+special",
                gt = { cmd("lua require('dap-go').debug_test()"), "Debug Go Test" }
            }
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
