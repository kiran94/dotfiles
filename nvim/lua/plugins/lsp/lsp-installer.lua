local options = {}

local nvim_lsp      = require('lspconfig')
local lsp_signature = require('lsp_signature')
local lsp_installer = require('nvim-lsp-installer')
local cmp           = require('cmp')
local cmp_nvim_lsp  = require('cmp_nvim_lsp')
local lsp_kind      = require('lspkind')
local lsp_colors    = require("lsp-colors")
local schemastore   = require('schemastore')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
table.insert(runtime_path, "~/.local/share/nvim/site/pack/packer/start/packer.nvim/lua")

vim.cmd[[hi Pmenu guibg=Black guifg=White gui=NONE]]
vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)
vim.fn.sign_define("DiagnosticSignError",       { text = "", texthl="DiagnosticSignError"  })
vim.fn.sign_define("DiagnosticSignWarn",        { text = "", texthl="DiagnosticSignWarn"  })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl="DiagnosticSignInformation"  })
vim.fn.sign_define("DiagnosticSignHint",        { text = "", texthl="DiagnosticSignHint"  })
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
    })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false;
capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = (function()
                local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
                table.sort(res)
                return res
            end)()
        }
    }
}

cmp_nvim_lsp.update_capabilities(capabilities)

lsp_kind.init{
    with_text = true,
    symbol_map = {
        Text        = "",
        Method      = "ƒ",
        Function    = "ﬦ",
        Constructor = "",
        Variable    = "",
        Class       = "",
        Interface   = "ﰮ",
        Module      = "",
        Property    = "",
        Unit        = "",
        Value       = "",
        Enum        = "了",
        Keyword     = "",
        Snippet     = "﬌",
        Color       = "",
        File        = "",
        Folder      = "",
        EnumMember  = "",
        Constant    = "",
        Struct      = "",
    }
}

lsp_signature.setup({
    hint_prefix = "",
    use_lspaga = true,
    hint_enable = false
})

local on_attach = function(client, _)
    lsp_signature.on_attach(client)

    -- NOTE: This is being disabled
    -- because null-ls is handling the formatting
    -- If you decide to switch back then comment these lines
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

options.config = function()
    --------------------------------
    -- LSP
    --------------------------------
    lsp_installer.on_server_ready(function(server)
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities
        }

        if server.name == "sumneko_lua" then
            opts.settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = runtime_path
                    },
                    diagnostics = {
                        globals = {'vim', 'use'},
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            }
        elseif server.name == "jsonls" then
            opts.settings = {
                json = {
                    -- Catalog: https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
                    schemas = schemastore.json.schemas()
                }
            }
        elseif server.name == "pylsp" then
            opts.settings = {
                pylsp = {
                    plugins = {
                        flake8      = { enabled = true },
                        pycodestyle = { enabled = false },
                        pyflakes    = { enabled = false },
                        yapf        = { enabled = false },
                        pylint      = { enabled = false },
                    }
                }
            }
        end

        server:setup(opts)
    end)

    --------------------------------
    -- COMPLETION
    --------------------------------

    -- Editor Completion
    cmp.setup({
        sources = cmp.config.sources({
            { name = 'nvim_lsp',   max_item_count = 10},
            { name = 'nvim_lua',   max_item_count = 5},
            { name = 'buffer',     max_item_count = 5},
            { name = 'treesitter', max_item_count = 5},
            { name = 'vsnip',      max_item_count = 5},
            { name = 'path',       max_item_count = 5},
            { name = 'spell',      max_item_count = 5},
            { name = 'calc',       max_item_count = 5},
            { name = 'emoji',      max_item_count = 5},
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = {
          ['<C-n>']     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<C-p>']     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ['<Down>']    = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<Up>']      = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-b>']     = cmp.mapping.scroll_docs(-4),
          ['<C-f>']     = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>']     = cmp.mapping.close(),
          ['<CR>']      = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          ['<TAB>']     = cmp.mapping(function(fallback)
              -- If the pop up menu is open then map to next item in the list
              if vim.fn.pumvisible() == 1 then
                  vim.fn.feedkeys(t("<C-n>"), "n")
              -- If we are in the middle of neogen generation then hump to next
              -- elseif neogen ~= nil and neogen.jumpable() then
              --     vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
              elseif check_back_space() then
                  vim.fn.feedkeys(t("<tab>"), "n")
              else
                  fallback()
              end
          end, { 'i', 's' })
        },
        formatting = {
            format = function (entry, vim_item)
                local menu_dict = {
                   nvim_lsp   = "ﲳ",
                   nvim_lua   = "",
                   treesitter = "",
                   path       = "ﱮ",
                   buffer     = "﬘",
                   zsh        = "",
                   vsnip      = "",
                   spell      = "暈",
                }

                local menu_literal = {
                   nvim_lsp   = "[LSP]",
                   nvim_lua   = "[LUA]",
                   treesitter = "[TREE]",
                   path       = "[PATH]",
                   buffer     = "[BUFF]",
                   zsh        = "[ZSH]",
                   vsnip      = "[SNIP]",
                   spell      = "[SPELL]",
                }

                vim_item.kind = string.format("%s %s", lsp_kind.presets.default[vim_item.kind], vim_item.kind)
                vim_item.menu = string.format("%s %s", menu_dict[entry.source.name], menu_literal[entry.source.name])
                return vim_item
            end
        },
        documentaton = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
    })

    -- Cmd Completion
    -- NOTE: This breaks tab completion in command
  --   cmp.setup.cmdline(':', {
  --     sources = cmp.config.sources({
  --         { name = 'path' }
  --     },
  --     {
  --         { name = 'cmdline' }
  --     })
  -- })

   -- Cmd Completion (Search)
    cmp.setup.cmdline('/', {
     sources = {
          { name = 'buffer', max_item_count = 5 }
        }
    })

    -- Colors
    lsp_colors.setup({
      Error       = "#db4b4b",
      Warning     = "#e0af68",
      Information = "#0db9d7",
      Hint        = "#10B981"
    })
end

return options
