return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    opts = function()
      local actions = require("telescope.actions")
      local telescope = require("telescope")

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
      })

      telescope.load_extension("file_browser")
      telescope.load_extension("fzf")
    end,
    keys = {
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        desc = "Find Files",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<cr>",
        desc = "Live Grep",
      },
      {
        "<leader>fw",
        "<cmd>Telescope grep_string<cr>",
        desc = "Grep String",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        desc = "Buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Help Tags",
      },
      {
        "<leader>fz",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "Fuzzy Find in Current Buffer",
      },
      {
        "<leader>gs",
        "<cmd>Telescope git_status<cr>",
        desc = "Git Status",
      },
      {
        "<leader>fi",
        "<cmd>Telescope lsp_implementations<cr>",
        desc = "LSP Implementations",
      },
      {
        "<leader>fr",
        "<cmd>Telescope lsp_references<cr>",
        desc = "LSP References",
      },
    },
  },
}
