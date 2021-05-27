local lspconfig = require("lspconfig")

local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false
end

lspconfig.cssls.setup({
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio",
  },
  filetypes = {
    "css",
    "scss",
    "less",
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_dir = lspconfig.util.root_pattern("package.json"),
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
  on_attach = on_attach,
})
