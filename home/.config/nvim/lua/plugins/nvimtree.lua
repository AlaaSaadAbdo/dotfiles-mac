vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_follow = 1 -- "0 by default, this option allows the cursor to be updated when entering a buffer
local tree_cb = require("nvim-tree.config").nvim_tree_callback
vim.g.nvim_tree_bindings = {
  -- ["<CR>"] = ":YourVimFunction()<cr>",
  -- ["u"] = ":lua require'some_module'.some_function()<cr>",

  -- default mappings
  ["<CR>"] = tree_cb("edit"),
  ["o"] = tree_cb("edit"),
  ["l"] = tree_cb("edit"),
  ["C"] = tree_cb("cd"),
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
  ["q"] = tree_cb("close"),
}
-- vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = { unstaged = "", staged = "✓", unmerged = "", renamed = "➜", untracked = "" },
  folder = { default = "", open = "", empty = "", empty_open = "", symlink = "" },
}

-- require("nvim-web-devicons").setup({
--   override = {
--     html = {
--       icon = "",
--       color = "#DE8C92",
--       name = "html",
--     },
--     css = {
--       icon = "",
--       color = "#61afef",
--       name = "css",
--     },
--     js = {
--       icon = "",
--       color = "#EBCB8B",
--       name = "js",
--     },
--     ts = {
--       icon = "ﯤ",
--       color = "#519ABA",
--       name = "ts",
--     },
--     kt = {
--       icon = "󱈙",
--       color = "#ffcb91",
--       name = "kt",
--     },
--     png = {
--       icon = " ",
--       color = "#BD77DC",
--       name = "png",
--     },
--     jpg = {
--       icon = " ",
--       color = "#BD77DC",
--       name = "jpg",
--     },
--     jpeg = {
--       icon = " ",
--       color = "#BD77DC",
--       name = "jpeg",
--     },
--     mp3 = {
--       icon = "",
--       color = "#C8CCD4",
--       name = "mp3",
--     },
--     mp4 = {
--       icon = "",
--       color = "#C8CCD4",
--       name = "mp4",
--     },
--     out = {
--       icon = "",
--       color = "#C8CCD4",
--       name = "out",
--     },
--     Dockerfile = {
--       icon = "",
--       color = "#b8b5ff",
--       name = "Dockerfile",
--     },
--     rb = {
--       icon = "",
--       color = "#ff75a0",
--       name = "rb",
--     },
--     vue = {
--       icon = "﵂",
--       color = "#7eca9c",
--       name = "vue",
--     },
--     py = {
--       icon = "",
--       color = "#a7c5eb",
--       name = "py",
--     },
--     toml = {
--       icon = "",
--       color = "#61afef",
--       name = "toml",
--     },
--     lock = {
--       icon = "",
--       color = "#DE6B74",
--       name = "lock",
--     },
--     zip = {
--       icon = "",
--       color = "#EBCB8B",
--       name = "zip",
--     },
--     xz = {
--       icon = "",
--       color = "#EBCB8B",
--       name = "xz",
--     },
--     deb = {
--       icon = "",
--       color = "#a3b8ef",
--       name = "deb",
--     },
--     rpm = {
--       icon = "",
--       color = "#fca2aa",
--       name = "rpm",
--     },
--   },
-- })
