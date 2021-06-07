local exec = vim.api.nvim_command
local fn, cmd = vim.fn, vim.cmd

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  exec("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  exec("packadd packer.nvim")
end

cmd("packadd packer.nvim")

cmd("au BufWritePost packages.lua PackerCompile")

local init = {
  -- Packer can manage itself as an optional plugin
  "wbthomason/packer.nvim",
  opt = true,
}

local lsp = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "neovim/nvim-lspconfig",
  "kabouzeid/nvim-lspinstall",
  "ojroques/nvim-lspfuzzy",
  "hrsh7th/nvim-compe",
  "glepnir/lspsaga.nvim",
  "tsuyoshicho/vim-efm-langserver-settings", -- trying to use it for linting
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  -- "nvim-treesitter/nvim-treesitter-refactor",
  "folke/lsp-colors.nvim",
  "folke/trouble.nvim",
  "mfussenegger/nvim-lint",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
}

local git = {
  "rhysd/conflict-marker.vim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  -- "TimUntersberger/neogit",
}

local misc = {
  "tweekmonster/startuptime.vim", -- benchmark startup
  "voldikss/vim-floaterm",
  "norcalli/nvim-colorizer.lua",
  "mbbill/undotree",
  { "lukas-reineke/indent-blankline.nvim", branch = "lua" },
  "dominikduda/vim_current_word",
  "phaazon/hop.nvim",
  "ethanholz/nvim-lastplace",
}

local text = {
  "scrooloose/nerdcommenter",
  "AndrewRadev/tagalong.vim",
  "AndrewRadev/splitjoin.vim",
  "machakann/vim-sandwich",
  "alvan/vim-closetag",
  "andymass/vim-matchup",
  "leafOfTree/vim-matchtag",
  "windwp/nvim-autopairs",
  "mhartington/formatter.nvim",
  "vimwiki/vimwiki",
}

local fzf = {
  { "junegunn/fzf", run = "./install --all" }, -- Fuzzy Searcher
  "junegunn/fzf.vim",
}

local test = {
  "janko/vim-test",
  { "rcarriga/vim-ultest", run = ":UpdateRemotePlugins" }, -- pretty test output
}

local snippets = {
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "sdras/vue-vscode-snippets",
  "rafamadriz/friendly-snippets",
}

local themes = {
  "sainnhe/gruvbox-material",
  -- "eddyekofo94/gruvbox-flat.nvim",
  "folke/tokyonight.nvim",
  -- "shaunsingh/nord.nvim",
  -- "shaunsingh/moonlight.nvim",
  -- "marko-cerovac/material.nvim",
}

local ui = {
  "kyazdani42/nvim-web-devicons",
  "glepnir/galaxyline.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/nvim-bufferline.lua",
  "p00f/nvim-ts-rainbow", -- this changes the highlight of definitions and todo to black text, maybe it should be loaded before the colorscheme
}

local lang = {
  "hashivim/vim-terraform",
  "cespare/vim-toml",
}

-- nothing under developement
-- local localplugins = {
-- }

local packer = require("packer")
packer.startup({
  {
    init,
    lsp,
    git,
    misc,
    fzf,
    test,
    snippets,
    themes,
    ui,
    text,
    lang,
    -- localplugins
  },
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})
