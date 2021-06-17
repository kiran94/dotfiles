-- vim.g.symbols_outline = {
--     highlight_hovered_item = true,
--     show_guides = true,
--     auto_preview = false, -- experimental
--     position = 'right',
--     keymaps = {
--         close = "<esc>",
--         goto_location = "<cr>",
--         focus_location = "o",
--         hover_symbol = "<c-space>",
--         rename_symbol = "r",
--         code_actions = "a"
--     },
--     lsp_blacklist = {}
-- }

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false
    })

local nvim_lsp = require('lspconfig')
local servers = {"pyls", "bashls", "vimls", "dockerls", "html", "cssls", "gopls", "sqlls", "tflint", "tsserver", "vuels"}

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

require'lspconfig'.omnisharp.setup{
    cmd = { "/usr/local/bin/omnisharp/run", "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) };
}

require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
