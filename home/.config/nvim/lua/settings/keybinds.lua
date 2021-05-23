local map = require "settings.utils".map
local g = vim.g

-- vim
map("n", ",", "<Nop>", {noremap = true})
g.mapleader = ","
vim.cmd("nnoremap <CR> :noh<CR><CR>:<backspace>")
map("n", "Q", "<Nop>", {noremap = true})
map("n", "q:", "<Nop>", {noremap = true})
vim.api.nvim_set_keymap("n", "x", '"_x', {noremap = true})
vim.api.nvim_set_keymap("v", "x", '"_xa', {noremap = true})

vim.cmd("tmap <C-o> <C-\\><C-n>")

vim.cmd("nnoremap <leader>r :lua reload()<CR>")

-- nvimtree
map("n", "<leader>q", ":NvimTreeToggle<CR>", {noremap = true})
map("n", "<leader>fc", ":NvimTreeFindFile<CR>", {noremap = true})

-- lsp
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true, silent = true})
map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})

vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> gK :Lspsaga hover_doc<CR>")
vim.cmd("nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>")
vim.cmd("nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>")
vim.cmd("nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
vim.cmd("nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

-- lsp saga
map("n", "gh", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true, silent = true})
-- show signature help
map("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", {noremap = true, silent = true})
-- rename
map("n", "grn", "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap = true, silent = true})
-- preview definition
map("n", "gds", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", {noremap = true, silent = true})

local function autocmd(event, triggers, operations)
  local cmd = string.format("autocmd %s %s %s", event, triggers, operations)
  vim.cmd(cmd)
end

autocmd("CursorHold", "<buffer>", "lua require'lspsaga.diagnostic'.show_line_diagnostics()")

-- compe
vim.cmd("inoremap <silent><expr> <C-Space> compe#complete()")
vim.cmd("inoremap <silent><expr> <CR>      compe#confirm('<CR>')")
vim.cmd("inoremap <silent><expr> <C-e>     compe#close('<C-e>')")
vim.cmd("inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })")
vim.cmd("inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })")

-- Telescope
map("n", "<Leader>bb", ":Telescope buffers<CR>", {noremap = true, silent = true})
map("n", "<Leader>fa", ":Telescope live_grep<CR>", {noremap = true, silent = true})
map("n", "<Leader>fb", ":Telescope file_browser<CR>", {noremap = true, silent = true})
map("n", "<Leader>ff", ":Telescope find_files<CR>", {noremap = true, silent = true})
map("n", "<Leader>fg", ":Telescope git_files<CR>", {noremap = true, silent = true})
map("n", "<Leader>fw", ":Telescope grep_string<CR>", {noremap = true, silent = true})
map("n", "<Leader>fh", ":Telescope oldfiles<CR>", {noremap = true, silent = true})
map("n", "<Leader>fl", ":Telescope loclist<CR>", {noremap = true, silent = true})
map("n", "<Leader>fcm", ":Telescope git_commits<CR>", {noremap = true, silent = true})
map("n", "<Leader>ft", ":Telescope help_tags<CR>", {noremap = true, silent = true})
map(
  "n",
  "<Leader>fd",
  ":Telescope dotfiles path=/Users/amansour/.config/nvim shorten_path=true<CR>",
  {noremap = true, silent = true}
)

-- Gitweb
vim.cmd("nnoremap <leader>gbc :!gitweb -B 'Google Chrome'<cr>")
vim.cmd("nnoremap <leader>gbf :!gitweb -B 'Firefox'<cr>")
