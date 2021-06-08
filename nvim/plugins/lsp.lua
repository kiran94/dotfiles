-- Language Servers
require'lspconfig'.diagnosticls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.tflint.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vuels.setup{}
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

-- Signature Completion
require'lsp_signature'.on_attach()
