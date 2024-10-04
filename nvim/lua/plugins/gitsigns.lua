return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = " ▎" },
        change = { text = " ▎" },
        delete = { text = " ▎" },
        topdelete = { text = " ▎" },
        changedelete = { text = " ▎" },
        untracked = { text = " ▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 1000,
      },
    },
  },
}
