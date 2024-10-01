return {
  -- telescope
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
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true })
        end,
        desc = "Explorer NeoTree",
      },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ focus = true })
        end,
        desc = "Focus NeoTree",
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer explorer",
      },
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      enable_diagnostics = false,

      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      source_selector = {
        winbar = true,
        statusline = false,
        show_scrolled_off_parent_node = false,
      },
      window = {
        position = "right",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["q"] = "none",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        bind_to_cwd = false,
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        diagnostics = {
          symbols = { error = " ", warn = " ", hint = " ", info = " " },
        },
        -- -- Change type
        -- added = "✚",
        -- deleted = "✖",
        -- modified = "",
        -- renamed = "󰁕",
        -- -- Status type
        -- untracked = "",
        -- ignored = "",
        -- unstaged = "󰄱",
        -- staged = "",
        -- conflict = "",
        --
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  },

  -- gitsigns
  { "lewis6991/gitsigns.nvim" },

  -- vim-illuminate
  {
    "RRethy/vim-illuminate",
    config = function()
      local illuminate = require("illuminate")

      illuminate.configure({
        delay = 200,
        large_file_cutoff = 2000,
        filetypes_denylist = { "NvimTree" },
      })

      vim.keymap.set("n", "<leader>n", function()
        illuminate.goto_next_reference()
      end)
      vim.keymap.set("n", "<leader>p", function()
        illuminate.goto_prev_reference()
      end)
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },

  -- todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
    },
  },
}
