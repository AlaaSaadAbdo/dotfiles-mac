local lspconfig = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  if server == "efm" then
    client.resolved_capabilities.document_formatting = true
  else
    client.resolved_capabilities.document_formatting = false
  end
  -- require "illuminate".on_attach(client)
end

lspconfig.rust_analyzer.setup {
  cmd = {vim.fn.stdpath("data") .. "/lspinstall/rust/rust-analyzer"},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"}
}
