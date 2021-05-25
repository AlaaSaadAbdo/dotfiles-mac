require("lsp.diagnostics")
require("lsp.lua")
-- Trying formatter instead of efm
-- require "lsp.efm"
require("lsp.ts")
require("lsp.css")
require("lsp.bash")
require("lsp.rust")

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
	"   (Text) ",
	"   (Method)",
	"   (Function)",
	"   (Constructor)",
	" ﴲ  (Field)",
	"[] (Variable)",
	"   (Class)",
	" ﰮ  (Interface)",
	"   (Module)",
	" 襁 (Property)",
	"   (Unit)",
	"   (Value)",
	" 練 (Enum)",
	"   (Keyword)",
	"   (Snippet)",
	"   (Color)",
	"   (File)",
	"   (Reference)",
	"   (Folder)",
	"   (EnumMember)",
	" ﲀ  (Constant)",
	" ﳤ  (Struct)",
	"   (Event)",
	"   (Operator)",
	"   (TypeParameter)",
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = false,
})

local lspconfig = require("lspconfig")

local servers = {
	"dockerls",
}

for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end
