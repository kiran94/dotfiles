local options = {}

options.config = function()

    local nvim_lsp      = require('lspconfig')
    local lsp_signature = require('lsp_signature')
    local cmp           = require('cmp')
    local cmp_nvim_lsp  = require('cmp_nvim_lsp')
    local lsp_kind      = require('lspkind')
    local lsp_colors    = require("lsp-colors")
    local schemastore   = require('schemastore')
    local mason         = require('mason')
    local mason_lsp     = require('mason-lspconfig')
    local lsp_progress  = require('fidget')
    local navic         = require("nvim-navic")
    local inlayhints    = require("lsp-inlayhints")

    local runtime_path = vim.split(package.path, ';')
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    table.insert(runtime_path, "~/.local/share/nvim/site/pack/packer/start/packer.nvim/lua")

    vim.lsp.set_log_level(vim.lsp.log_levels.ERROR)
    vim.fn.sign_define("DiagnosticSignError",       { text = "", texthl="DiagnosticSignError"  })
    vim.fn.sign_define("DiagnosticSignWarn",        { text = "", texthl="DiagnosticSignWarn"  })
    vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl="DiagnosticSignInformation"  })
    vim.fn.sign_define("DiagnosticSignHint",        { text = "", texthl="DiagnosticSignHint"  })

    vim.diagnostic.config({
        virtual_text     = false,
        underline        = false,
        signs            = true,
        update_in_insert = true,
        float = {
            border = "rounded"
        }
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

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

    cmp_nvim_lsp.default_capabilities(capabilities)

    lsp_kind.init{
        mode = 'symbol_text',
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



    -- NOTE: Disabled for cmp-nvim-lsp-signature-help
    -- local lspsaga_installed, _ = pcall(require, 'lspsaga')
    -- lsp_signature.setup({
    --     hint_prefix = "",
    --     use_lspaga  = lspsaga_installed,
    --     hint_enable = false,
    --     handler_opts = {
    --         border = "rounded"
    --     }
    -- })

    local on_attach = function(client, bufnr)
        require("illuminate").on_attach(client, bufnr)
        inlayhints.on_attach(client, bufnr)

        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end

        -- NOTE: <= 0.7 This is being disabled
        -- because null-ls is handling the formatting
        -- If you decide to switch back then comment these lines
        -- if vim.fn.has "nvim-0.7" then
        --     client.resolved_capabilities.document_formatting = false
        --     client.resolved_capabilities.document_range_formatting = false
        -- end

        -- 0.8 Allow null-ls to handle formatting
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col '.' - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
    end

    mason.setup()
    mason_lsp.setup({
        ensure_installed = {
            -- LSPs
            "lua_ls",
            "pylsp",
            "gopls",
            "terraformls",
            "bashls",
            "yamlls",
            "jsonls",
            "dockerls",
            "docker_compose_language_service",
            "clangd",
            "cmake",
            "taplo"
            -- LINTER & FORMATTING
            -- "flake8",
            -- "isort",
            -- "autopep8",
            -- "goimports",
            -- "gofmt",
            -- "staticcheck",
            -- "stylua",
            -- "clang-format",
            -- "jq" ,
            -- "yamllint",
            -- "yamlfmt",
            -- DAPS
            -- "debugpy",
            -- "delve",
        },
        automatic_installation = true
    })
    inlayhints.setup()


    -- TODO: Refactor the below code via setup_handlers
    -- mason_lsp.setup_handlers()

    -- LSP Import Name to Language Server name can be found in:
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    nvim_lsp.pylsp.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pylsp = {
                plugins = {
                    -- note: these are now managed in ./null-ls.lua
                    flake8      = { enabled = false },
                    pycodestyle = { enabled = false },
                    pyflakes    = { enabled = false },
                    yapf        = { enabled = false },
                    pylint      = { enabled = false },
                    mccabe      = { enabled = false },
                }
            }
        }
    }

    nvim_lsp.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            -- https://github.com/sumneko/lua-language-server/wiki/Configuration-File
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = runtime_path
                },
                diagnostics = {
                    globals = {'vim', 'use', 'use_rocks'},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false, -- Stop luarc prompts
                },
                telemetry = {
                    enable = false,
                },
                hint = {
                    enable = false,
                }
            }
        }
    }

    nvim_lsp.pyright.setup{
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            python = {
                analysis = {
                    -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
                    typeCheckingMode = "off"
                }
            }
        }
    }

    nvim_lsp.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            json = {
                -- Catalog: https://github.com/SchemaStore/schemastore/blob/master/src/api/json/catalog.json
                schemas = schemastore.json.schemas(),
                validate = { enable = true }
            }
        }
    }

    nvim_lsp.yamlls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = schemastore.json.schemas(),
        },
      }
    }

    nvim_lsp.gopls.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        gopls = {
            hints = {
                assignVariableTypes    = true,
                compositeLiteralFields = true,
                functionTypeParameters = true,
                rangeVariableTypes     = false,
                parameterNames         = false,
                constantValues         = false,
            },
        },
      },
    }

    nvim_lsp.terraformls.setup{
        on_attach = function(client, buffernr)
            on_attach(client, buffernr)

            local ok, treesitter_tf_doc = pcall(require, 'treesitter-terraform-doc')
            if ok then
                treesitter_tf_doc.setup({command_name = "TerraformDoc"})
            end
        end
    }

    nvim_lsp.rust_analyzer.setup{
      on_attach = on_attach,
      capabilities = capabilities,
      -- https://rust-analyzer.github.io/manual.html#configuration
      settings = {
        ['rust-analyzer'] = {
          diagnostics = {
            enable = true;
          }
        }
      }
    }

    nvim_lsp.bashls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.yamlls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.dockerls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.docker_compose_language_service.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.cmake.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.taplo.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.csharp_ls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.clangd.setup{ on_attach = on_attach, capabilities = { offsetEncoding = "utf-8" }, }

    --------------------------------

    -- COMPLETION
    --------------------------------

    -- Editor Completion
    cmp.setup({
        sources = cmp.config.sources({
            { name = 'nvim_lsp',   max_item_count = 10},
            { name = 'nvim_lua',   max_item_count = 25},
            { name = 'buffer',     max_item_count = 5},
            { name = 'vsnip',      max_item_count = 10},
            { name = 'treesitter', max_item_count = 5},
            { name = 'path',       max_item_count = 5},
            { name = 'spell',      max_item_count = 5},
            { name = 'calc',       max_item_count = 5},
            { name = 'emoji',      max_item_count = 5},
            { name = 'nvim_lsp_signature_help' }
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
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
                vim_item.menu = string.format("%s %s", menu_dict[entry.source.name] or '', menu_literal[entry.source.name] or '')
                return vim_item
            end
        },
        documentaton = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        }
    })

    -- Cmd Completion
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
          { name = 'cmdline', max_item_count = 20 }
        }
      )
  })

   -- Cmd Completion (Search)
    cmp.setup.cmdline('/', {
     mapping = cmp.mapping.preset.cmdline(),
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

    lsp_progress.setup{}
end



return options
