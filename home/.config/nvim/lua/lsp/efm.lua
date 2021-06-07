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

local markdownlint = {
  lintCommand = "markdownlint -s",
  lintStdin = true,
  -- lintFormats = { "%f:%l %m", "%f:%l:%c %m", "%f: %l: %m" },
}

local shellcheck = {
  LintCommand = "shellcheck -f gcc -x",
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
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
    "sh",
    "zsh",
    "markdown",
  },
  settings = {
    rootMarkers = { "package.json", ".git" },
    lintDebounce = 500,
    languages = {
      typescript = { eslint_d },
      javascript = { eslint_d },
      typescriptreact = { eslint_d },
      javascriptreact = { eslint_d },
      markdown = { markdownlint },
      sh = { shellcheck },
      -- zsh = { shellcheck },
    },
  },
})
