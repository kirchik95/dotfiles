local gitsigns = require("gitsigns")

gitsigns.setup({
  signs = {
    -- add = { hl = "GitSignsAdd", text = " ▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    -- change = { hl = "GitSignsChange", text = " ▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    -- delete = { hl = "GitSignsDelete", text = " ▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    -- topdelete = { hl = "GitSignsDelete", text = " ▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    -- changedelete = { hl = "GitSignsChange", text = " ▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    -- untracked = { hl = "GitSignsChange", text = " ▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
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
})
