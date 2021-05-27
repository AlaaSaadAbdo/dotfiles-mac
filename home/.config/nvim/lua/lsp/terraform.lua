require("lspconfig").terraformls.setup({
  cmd = { vim.fn.stdpath("data") .. "/lspinstall/terraform/terraform-ls", "serve" },
  filetypes = { "terraform", "hcl" },
})
