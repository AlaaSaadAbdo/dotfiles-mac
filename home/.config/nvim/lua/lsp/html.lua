local lspconfig = require("lspconfig")

local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
end

lspconfig.html.setup({
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio",
  },
  filetypes = { "html", "tsx", "jsx", "javascriptreact", "typescriptreact" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
  settings = {},
  on_attach = on_attach,
})
