local util = require("lspconfig/util")
local lspconfig = require("lspconfig")

local prettier = {
	formatCommand = "prettierd --stdin-filepath ${INPUT}",
	formatStdin = true,
}

local eslint_d = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT} --fix-to-stdout",
	formatStdin = true,
}
local luaFormat = {
	-- formatCommand = "stylua %{",
	-- formatStdin = true,
}

local rustFormat = {
	formatCommand = "rustfmt",
	formatStdin = true,
}

lspconfig.efm.setup({
	root_dir = util.root_pattern(".git", vim.fn.getcwd()),
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = true
	end,
	init_options = {
		documentFormatting = true,
		codeAction = true,
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
		"rust",
	},
	settings = {
		rootMarkers = { "package.json", ".git" },
		lintDebounce = 500,
		languages = {
			typescript = { eslint_d, prettier },
			javascript = { eslint_d, prettier },
			typescriptreact = { eslint_d, prettier },
			javascriptreact = { eslint_d, prettier },
			lua = { luaFormat },
			html = { prettier },
			css = { prettier },
			scss = { eslint_d, prettier },
			json = { prettier },
			conf = { prettier },
			rust = { rustFormat },
		},
	},
})
