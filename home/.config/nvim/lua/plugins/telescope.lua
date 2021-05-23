local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    -- find_command = {"rg", "--no-column", "--with-filename", "--line-number", "--smart-case"},
    prompt_position = "bottom",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_defaults = {
      horizontal = {mirror = false, preview_width = 0.6},
      vertical = {mirror = false}
    },
    file_sorter = require "telescope.sorters".get_fuzzy_file,
    file_ignore_patterns = {"build", "node_modules", ".git"},
    generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
    color_devicons = true,
    use_less = true,
    set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
    file_previewer = require "telescope.previewers".vim_buffer_cat.new,
    grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  },
  extensions = {
    fzf = {
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
    fzf_writer = {
      use_highlighter = true,
      minimum_grep_characters = 2
    }
  }
}

require("telescope").load_extension("dotfiles")
require("telescope").load_extension("fzf")

local M = {}

function M.grep_dot_files()
  require("telescope").extensions.fzf_writer.staged_grep {
    prompt_title = "~ Dotfiles ~",
    shorten_path = true,
    vimgrep_arguments = {
      "rg",
      "--hidden",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    cwd = "~/.homesick/repos/dotfiles",
    layout_strategy = "flex",
    layout_defaults = {
      horizontal = {mirror = false, preview_width = 0.6},
      vertical = {mirror = false}
    },
    preview_width = 0.6
  }
end

function M.fzf_live_grep()
  require("telescope").extensions.fzf_writer.staged_grep {
    layout_strategy = "flex",
    layout_defaults = {
      horizontal = {mirror = false, preview_width = 0.6},
      vertical = {mirror = false}
    },
    preview_width = 0.6,
    shorten_path = false,
    fzf_separator = "|"
  }
end

return M
