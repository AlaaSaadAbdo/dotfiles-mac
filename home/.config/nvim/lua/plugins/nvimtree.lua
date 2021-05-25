vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
local tree_cb = require "nvim-tree.config".nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- ["<CR>"] = ":YourVimFunction()<cr>",
  -- ["u"] = ":lua require'some_module'.some_function()<cr>",

  -- default mappings
  ["<CR>"] = tree_cb("edit"),
  ["o"] = tree_cb("edit"),
  ["l"] = tree_cb("edit"),
  ["<C-]>"] = tree_cb("cd"),
  ["v"] = tree_cb("vsplit"),
  ["s"] = tree_cb("split"),
  ["<C-t>"] = tree_cb("tabnew"),
  ["<"] = tree_cb("prev_sibling"),
  [">"] = tree_cb("next_sibling"),
  ["<BS>"] = tree_cb("close_node"),
  ["h"] = tree_cb("close_node"),
  ["<S-CR>"] = tree_cb("close_node"),
  ["<Tab>"] = tree_cb("preview"),
  ["I"] = tree_cb("toggle_ignored"),
  ["H"] = tree_cb("toggle_dotfiles"),
  ["R"] = tree_cb("refresh"),
  ["a"] = tree_cb("create"),
  ["d"] = tree_cb("remove"),
  ["r"] = tree_cb("rename"),
  ["<C-r>"] = tree_cb("full_rename"),
  ["x"] = tree_cb("cut"),
  ["c"] = tree_cb("copy"),
  ["p"] = tree_cb("paste"),
  ["[c"] = tree_cb("prev_git_item"),
  ["]c"] = tree_cb("next_git_item"),
  ["-"] = tree_cb("dir_up"),
  ["q"] = tree_cb("close")
}
-- vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = ""},
  folder = {default = "", open = "", empty = "", empty_open = "", symlink = ""}
}

-- local events = require("nvim-tree.events")
-- events.on_file_created(
--   function(data)
--     if #vim.api.nvim_list_wins() == 1 then
--       -- vim.cmd("vsplit " .. data.fname)
--       vim.cmd("/ " .. data.fname)
--     else
--       -- vim.cmd("wincmd l | edit " .. data.fname)
--       vim.cmd("/ " .. data.fname)
--     end
--   end
-- )
