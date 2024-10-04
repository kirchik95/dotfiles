return {
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
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
    end,
  },
}
