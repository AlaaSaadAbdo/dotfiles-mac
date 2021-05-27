local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

local eslint_d = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %m" },
  lintIgnoreExitCode = true,
  -- formatCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --fix-to-stdout",
  -- formatStdin = true,
}

lspconfig.efm.setup({
  root_dir = util.root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    documentFormatting = false,
    codeAction = true,
  },
  filetypes = {
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
  },
  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = {
      typescript = { eslint_d },
      javascript = { eslint_d },
      typescriptreact = { eslint_d },
      javascriptreact = { eslint_d },
    },
  },
})
