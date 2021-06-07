vim.cmd([[packadd formatter.nvim]])

local prettier = function()
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

local terraform = function()
  return {
    exe = "terraform",
    args = { "fmt", "-" },
    stdin = true,
  }
end

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

local shfmt = function()
  return {
    exe = "shfmt",
    args = {
      "-ci",
      "-s",
      "-bn",
    },
    stdin = true,
  }
end

-- local pandoc = function()
--   return {
--     exe = "pandoc",
--     args = {
--       "-f markdown",
--       "-t gfm",
--       "-sp",
--       "--tab-stop=2",
--     },
--     stdin = true,
--   }
-- end

require("formatter").setup({
  logging = true,
  filetype = {
    typescriptreact = { prettier },
    javascriptreact = { prettier },
    javascript = { prettier },
    typescript = { prettier },
    scss = { prettier },
    css = { prettier },
    jsonc = { prettier },
    json = { prettier },
    html = { prettier },
    rust = { rustfmt },
    lua = { stylua },
    terraform = { terraform },
    sh = { shfmt },
    markdown = { prettier },
  },
})

-- prettier does what we want now
-- require("formatter").setup({
--   logging = true,
--   filetype = {
--     typescriptreact = { eslint_d, prettier },
--     javascriptreact = { eslint_d, prettier },
--     javascript = { eslint_d, prettier },
--     typescript = { eslint_d, prettier },
--     css = { prettier },
--     jsonc = { prettier },
--     json = { prettier },
--     html = { prettier },
--     rust = { rustfmt },
--     lua = { stylua },
--   },
-- })
