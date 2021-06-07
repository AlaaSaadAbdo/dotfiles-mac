local ts = require("nvim-treesitter.configs")

ts.setup({
  ensure_installed = "maintained",
  highlight = {
    enable = false,
    use_languagetree = false,
  },
  indent = {
    enable = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = false,
    lint_events = { "BufWrite", "CursorHold" },
  },
  -- refactor = {
  --   highlight_definitions = { enable = false },
  --   highlight_current_scope = { enable = false },
  --   smart_rename = {
  --     enable = true,
  --     keymaps = {
  --       smart_rename = "grr",
  --     },
  --   },
  -- },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 500, -- Do not enable for files with more than 1000 lines, int
  },
})
