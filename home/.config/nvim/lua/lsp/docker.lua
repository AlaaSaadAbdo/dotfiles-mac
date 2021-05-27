local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
end

require("lspconfig").dockerls.setup({
  cmd = { vim.fn.stdpath("data") .. "/lspinstall/dockerfile/node_modules/.bin/docker-langserver", "--stdio" },
  on_attach = on_attach,
  root_dir = vim.loop.cwd,
})
