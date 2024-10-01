local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local telescope = require("telescope")

local layout_strategies = require("telescope.pickers.layout_strategies")

layout_strategies.vertical_fused = function(picker, max_columns, max_lines, layout_config)
  local layout = layout_strategies.vertical(picker, max_columns, max_lines, layout_config)

  layout.prompt.title = ""
  layout.results.title = ""

  if layout.preview then
    layout.preview.title = ""
    layout.preview.height = layout.preview.height + 1
    layout.preview.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    layout.results.borderchars = { "─", "│", "─", "│", "├", "┤", "┤", "├" }
  else
    layout.results.borderchars = { "─", "│", "─", "│", "╭", "╮", "┤", "├" }
  end

  layout.results.height = layout.results.height + 1

  layout.prompt.borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

  return layout
end

--[[ telescope.setup({
  defaults = {
    initial_mode = "insert",
    layout_strategy = "vertical_fused",
    layout_config = {
      preview_cutoff = 1,
      width = 0.55,
      height = 0.7,
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    path_display = { "truncate" },
    winblend = 0,
    color_devicons = false,
    sorting_strategy = "descending",
    mappings = {
      i = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-x>"] = actions.select_horizontal,
      },
      n = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-x>"] = actions.select_horizontal,
        ["q"] = require("telescope.actions").close,
      },
    },
  },
  pickers = {
    live_grep = { file_ignore_patterns = { "node_modules" } },
    find_files = { file_ignore_patterns = { "node_modules" } },
    git_status = {
      initial_mode = "normal",
    },
  },
  extensions = {
    file_browser = {
      previewer = true,
      grouped = true,
      hijack_netrw = false,
      hidden = true,
      initial_mode = "normal",
      use_fd = false,
      respect_gitignore = false,
    },
  },
}) ]]

telescope.setup({
  pickers = {
    live_grep = { file_ignore_patterns = { "node_modules" } },
    find_files = { file_ignore_patterns = { "node_modules" } },
  },

  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fw", builtin.grep_string, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {})
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
