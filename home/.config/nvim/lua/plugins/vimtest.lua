vim.cmd("let g:test#preserve_screen = 1")
vim.cmd("let test#strategy = 'neovim'")

vim.cmd("nmap <silent> <leader>tn :TestNearest<CR>")
vim.cmd("nmap <silent> <leader>tf :TestFile<CR>")
vim.cmd("nmap <silent> <leader>ts :TestSuite<CR>")
vim.cmd("nmap <silent> <leader>tl :TestLast<CR>")
