return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "yaml",
        "javascript",
        "typescript",
        "jsdoc",
        "json",
        "tsx",
        "html",
        "css",
        "scss",
        "markdown",
      },

      sync_install = false,
      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = false,
      mode = "cursor",
      max_lines = 3,
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end,
  },
}
