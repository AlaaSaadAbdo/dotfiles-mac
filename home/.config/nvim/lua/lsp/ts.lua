local lspconfig = require("lspconfig")

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, server)
  client.resolved_capabilities.document_formatting = false
end

lspconfig.tsserver.setup({
  cmd = { vim.fn.stdpath("data") .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server", "--stdio" },
  -- on_attach = on_attach,
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  capabilities = capabilities,
  settings = { documentFormatting = false },
  on_attach = on_attach,
  commands = {
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    },
  },
})
