return {
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
}
