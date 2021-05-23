local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec "packadd packer.nvim"
end

cmd "packadd packer.nvim"

cmd "au BufWritePost packages.lua PackerCompile"

local init = {
  -- Packer can manage itself as an optional plugin
  "wbthomason/packer.nvim",
  opt = true
}

local lsp = {
  "nvim-lua/plenary.nvim",
  "neovim/nvim-lspconfig",
  "kabouzeid/nvim-lspinstall",
  "ojroques/nvim-lspfuzzy",
  "hrsh7th/nvim-compe",
  "glepnir/lspsaga.nvim",
  "tsuyoshicho/vim-efm-langserver-settings", -- auto config efm lsp
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  "nvim-treesitter/nvim-treesitter-refactor"
}

local git = {
  -- "tpope/vim-fugitive",
  "rhysd/conflict-marker.vim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim"
}

local misc = {
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  "nvim-telescope/telescope-fzf-writer.nvim",
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  "scrooloose/nerdcommenter",
  "tweekmonster/startuptime.vim", -- benchmark startup
  "AndrewRadev/tagalong.vim",
  "AndrewRadev/splitjoin.vim",
  "machakann/vim-sandwich",
  "alvan/vim-closetag",
  "voldikss/vim-floaterm",
  "andymass/vim-matchup",
  "leafOfTree/vim-matchtag", --highlight matching tags html, xml, js, jsx, vue, svelte.
  "windwp/nvim-autopairs",
  "norcalli/nvim-colorizer.lua",
  "mbbill/undotree",
  "folke/lsp-colors.nvim",
  {"lukas-reineke/indent-blankline.nvim", branch = "lua"},
  "RRethy/vim-illuminate"
}

local fzf = {
  {"junegunn/fzf", run = "./install --all"}, -- Fuzzy Searcher
  "junegunn/fzf.vim"
}

local test = {
  "janko/vim-test",
  "rcarriga/vim-ultest" -- pretty test output
}

local snippets = {
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "sdras/vue-vscode-snippets",
  "rafamadriz/friendly-snippets"
}

local themes = {
  "sainnhe/gruvbox-material",
  "folke/tokyonight.nvim"
}

local ui = {
  "kyazdani42/nvim-web-devicons",
  "glepnir/galaxyline.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/nvim-bufferline.lua"
}

local packer = require("packer")
packer.startup {
  {
    init,
    lsp,
    git,
    misc,
    fzf,
    test,
    snippets,
    themes,
    ui
  },
  config = {
    display = {
      open_fn = require "packer.util".float
    }
  }
}
