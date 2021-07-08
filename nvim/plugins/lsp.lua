
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false
    })

vim.cmd [[ sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl= ]]
vim.cmd [[ sign define LspDiagnosticsSignHint text= texthl=LspDiagnosticsSignHint linehl= numhl= ]]

local nvim_lsp = require('lspconfig')
local servers = {"pyright", "bashls", "vimls", "dockerls", "html", "cssls", "gopls", "sqlls", "tflint", "tsserver", "vuels", "gopls"}

-- Configure Capabilities
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

-- Attach
local on_attach = function(client,  buffer)
  -- Signature Completion
  require'lsp_signature'.on_attach(client)
end

-- Configure each of the Servers
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { capabilities = capabilities, on_attach = on_attach }
end

-- Omnisharp
require'lspconfig'.omnisharp.setup{
    cmd = { "/usr/local/bin/omnisharp/run", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) };
}

-- Json
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

-- Python
nvim_lsp.pyls.setup {
    settings = {
        pyls = {
            plugins = {
                pycodestyle = { enabled = true; };
                pyflakes = { enabled = true; };
                pyls_mypy = { enabled = true; live_mode = false; };
                yapf = { enabled = false; };
                pylint = { enabled = false; };
            };
        };
    };
    on_attach = on_attach;
    capabilities = capabilities;
}
