" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/Users/amansour/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/amansour/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/amansour/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/amansour/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/amansour/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["conflict-marker.vim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/conflict-marker.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/gruvbox-material"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lastplace"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lastplace"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lint"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspfuzzy"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lspfuzzy"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-efm-langserver-settings"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-efm-langserver-settings"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-matchtag"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-matchtag"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-terraform"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vim_current_word = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vim_current_word"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["vue-vscode-snippets"] = {
    loaded = true,
    path = "/Users/amansour/.local/share/nvim/site/pack/packer/start/vue-vscode-snippets"
  }
}

time("Defining packer_plugins", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
