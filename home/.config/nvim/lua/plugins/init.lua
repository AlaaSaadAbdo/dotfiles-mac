require "plugins.nvimtree"
require "plugins.theme"
require "plugins.bufferline"
require "plugins.nerdcommenter"
require "plugins.fzf"
require "plugins.sandwich"
require "plugins.compe"
require "plugins.galaxyline"
require "plugins.blank-line"
require "plugins.treesitter"
require "plugins.matchup"
require "plugins.autopairs"
require "plugins.telescope"
require "plugins.lspfuzzy"
require "plugins.signs"

require "colorizer".setup()

vim.cmd("nnoremap <leader>dot :lua require('plugins.telescope').grep_dot_files()<cr>")
