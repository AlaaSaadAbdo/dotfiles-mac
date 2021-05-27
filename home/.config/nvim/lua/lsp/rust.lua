local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
end

lspconfig.rust_analyzer.setup({
  cmd = { vim.fn.stdpath("data") .. "/lspinstall/rust/rust-analyzer" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
})
