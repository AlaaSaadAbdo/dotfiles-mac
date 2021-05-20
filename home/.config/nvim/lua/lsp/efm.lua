local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT} --single-quote --semi false",
  formatStdin = true
}

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --fix-to-stdout",
  formatStdin = true
}
local luaFormat = {
  formatCommand = "npx luafmt --indent-count 2 --stdin",
  formatStdin = true
}

local rustFormat = {
  formatCommand = "rustfmt",
  formatStdin = true
}

lspconfig.efm.setup {
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
  end,
  init_options = {
    documentFormatting = true,
    codeAction = true
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "lua",
    "css",
    "scss",
    "html",
    "rust"
  },
  settings = {
    rootMarkers = {"package.json", ".git"},
    lintDebounce = 500,
    languages = {
      typescript = {eslint_d},
      javascript = {eslint_d},
      typescriptreact = {eslint_d},
      javascriptreact = {eslint_d},
      lua = {luaFormat},
      html = {prettier},
      css = {prettier},
      scss = {eslint_d, prettier},
      json = {prettier},
      conf = {prettier},
      rust = {rustFormat}
    }
  }
}
