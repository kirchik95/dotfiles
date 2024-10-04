return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "BufReadPre",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
      options = {
        diagnostics = false,
        mode = "tabs",
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = false,
        themable = true,
        name_formatter = function(buf)
          return "󰈙 " .. buf.name
        end,
        indicator = { style = "none" },
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
