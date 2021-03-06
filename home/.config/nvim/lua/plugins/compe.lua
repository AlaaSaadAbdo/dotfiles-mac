vim.o.completeopt = "menuone,noselect"
require("compe").setup({
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  source = {
    path = { kind = "   (Path)" },
    buffer = { kind = "   (Buffer)" },
    calc = { kind = "   (Calc)" },
    vsnip = { kind = "   (Snippet)" },
    nvim_lsp = { kind = "   (LSP)" },
    nvim_lua = true,
    spell = { kind = "   (Spell)" },
    tags = false,
    snippets_nvim = false, --{kind = "  "}
    ultisnips = false, --{kind = "  "}
    treesitter = false, --{kind = "  "}
    emoji = { kind = " ﲃ  (Emoji)", filetypes = { "markdown", "text" } },
  },
})
