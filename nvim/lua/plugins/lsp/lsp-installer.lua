local options = {}

options.config = function()

    local nvim_lsp      = require('lspconfig')
    local cmp_nvim_lsp  = require('cmp_nvim_lsp')
    local schemastore   = require('schemastore')
    local navic         = require("nvim-navic")
    local inlayhints    = require("lsp-inlayhints")
    local mason_registry = require("mason-registry")

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


    local on_attach = function(client, bufnr)
        require("illuminate").on_attach(client, bufnr)
        inlayhints.on_attach(client, bufnr)

        if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
        end

        -- Allow null-ls to handle formatting
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end



    inlayhints.setup()

    -- LSP Import Name to Language Server name can be found in:
    -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
    nvim_lsp.pylsp.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pylsp = {
                plugins = {
                    -- note: these are now managed in ./null-ls.lua / conform.nvim / nvim-lint
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

    -- nvim_lsp.pylyzer.setup{}

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

    -- nvim_lsp.pyright.setup{
    --     capabilities = capabilities,
    --     on_attach = on_attach,
    --     settings = {
    --         python = {
    --             analysis = {
    --                 -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md
    --                 typeCheckingMode = "off"
    --             }
    --         }
    --     }
    -- }

    -- nvim_lsp.ruff_lsp.setup{
    --   init_options = {
    --     settings = {
    --       args = {},
    --     }
    --   }
    -- }

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
            completeUnimported = true,
            usePlaceholders = true,
            -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
            analyses = {
                unusedparams = true,
                unusedwrite = true,
                unusedvariable = true,
                nillness = true,
                shadow = true,
                useany = false,
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

    -- nvim_lsp.rust_analyzer.setup{
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    --   -- https://rust-analyzer.github.io/manual.html#configuration
    --   settings = {
    --     ['rust-analyzer'] = {
    --       diagnostics = {
    --         enable = true;
    --       }
    --     }
    --   }
    -- }

    nvim_lsp.bashls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.yamlls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.dockerls.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.docker_compose_language_service.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.cmake.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.taplo.setup{ on_attach = on_attach, capabilities = capabilities }
    nvim_lsp.marksman.setup{ on_attach = on_attach, capabilities = capabilities, }
    require'lspconfig'.hyprls.setup{}
    nvim_lsp.clangd.setup{ on_attach = on_attach, capabilities = { offsetEncoding = "utf-8" }, }

    if mason_registry.is_installed("omnisharp") then
        local omnisharp_path = mason_registry.get_package("omnisharp"):get_install_path()

        nvim_lsp.omnisharp.setup{
            on_attach = on_attach,
            capabilities = capabilities,
            handlers = {
                ["textDocument/definition"] = require('omnisharp_extended').handler,
            },
            cmd = { omnisharp_path .. '/omnisharp', '--languageserver' , '--hostPID', tostring(vim.fn.getpid()), '--loglevel', 'ERROR' },
        }
    end

end

return options
