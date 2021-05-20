local ts = require "nvim-treesitter.configs"

ts.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = {
    enable = false
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"}
  }
  -- refactor = {
  --   highlight_definitions = {enable = true},
  --   highlight_current_scope = {enable = true},
  --   smart_rename = {
  --     enable = true,
  --     keymaps = {
  --       smart_rename = "grr"
  --     }
  --   }
  -- }
}
