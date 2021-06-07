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

local on_attach = function(client)
  client.resolved_capabilities.document_formatting = false

  local ts_utils = require("nvim-lsp-ts-utils")
  -- defaults
  ts_utils.setup({
    debug = false,
    disable_commands = false,
    enable_import_on_completion = true,
    import_on_completion_timeout = 5000,

    -- eslint
    eslint_enable_code_actions = true,
    eslint_bin = "eslint",
    eslint_args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
    eslint_enable_disable_comments = true,

    -- experimental settings!
    -- eslint diagnostics
    eslint_enable_diagnostics = false,
    eslint_diagnostics_debounce = 250,

    -- formatting
    enable_formatting = false,

    -- parentheses completion
    complete_parens = false,
    signature_help_in_parens = false,

    -- update imports on file move
    update_imports_on_move = true,
    require_confirmation_on_move = true,
    watch_dir = "/src",
  })

  -- required to enable ESLint code actions and formatting
  ts_utils.setup_client(client)
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
