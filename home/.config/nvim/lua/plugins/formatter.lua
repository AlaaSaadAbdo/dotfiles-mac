vim.cmd([[packadd formatter.nvim]])

local prettierd = function()
	return {
		exe = "prettier",
		args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote", "--semi false" },
		stdin = true,
	}
end

-- prettier does what we want now
-- local eslint_d = function()
--   return {
--     exe = "eslint_d",
--     args = { "-f unix", "--stdin", "--stdin-filename ${INPUT}", "--fix-to-stdout" },
--     stdin = true,
--   }
-- end

local rustfmt = function()
	return {
		exe = "rustfmt",
		args = { "--emit=stdout" },
		stdin = true,
	}
end

local stylua = function()
	return {
		exe = "stylua",
		args = {
			"--config-path",
			"~/.config/nvim/.stylua",
			"-",
		},
		stdin = true,
	}
end

require("formatter").setup({
	logging = true,
	filetype = {
		typescriptreact = { prettierd },
		javascriptreact = { prettierd },
		javascript = { prettierd },
		typescript = { prettierd },
		css = { prettierd },
		jsonc = { prettierd },
		json = { prettierd },
		html = { prettierd },
		rust = { rustfmt },
		lua = { stylua },
	},
})

-- prettier does what we want now
-- require("formatter").setup({
--   logging = true,
--   filetype = {
--     typescriptreact = { eslint_d, prettierd },
--     javascriptreact = { eslint_d, prettierd },
--     javascript = { eslint_d, prettierd },
--     typescript = { eslint_d, prettierd },
--     css = { prettierd },
--     jsonc = { prettierd },
--     json = { prettierd },
--     html = { prettierd },
--     rust = { rustfmt },
--     lua = { stylua },
--   },
-- })
