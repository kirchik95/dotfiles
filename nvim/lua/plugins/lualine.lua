return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      local lualine = require("lualine")

      local assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "󰉋",
        file = "󰈙",
        lsp = {
          server = "󰅡 ",
          error = "",
          warning = "",
          info = "",
          hint = "",
        },
        git = {
          branch = "nf-pl-branch",
          added = "",
          changed = "",
          removed = "",
        },
      }

      local function dir()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

        return assets.dir .. " " .. dir_name
      end

      local sections = {
        filetype = {
          "filetype",
          padding = { left = 1, right = 0 },
          colored = false,
          icon_only = true,
          color = { fg = "#6E738D", bg = "none" },
        },
        filename = {
          "filename",
          fmt = function(filename)
            return assets.file .. " " .. filename
          end,
          symbols = {
            modified = "●",
            readonly = "",
            unnamed = "",
          },
          color = { fg = "#6E738D", bg = "none" },
        },
      }

      local winbar = {
        active = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            sections.filename,
            {
              color = { fg = "#6E738D", bg = "none" },
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        inactive = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            sections.filename,
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }

      lualine.setup({
        options = {
          globalstatus = true,
          theme = "catppuccin",
          component_separators = "",
          section_separators = "",
          disabled_filetypes = { winbar = { "NvimTree", "neo-tree", "AvanteInput", "Avante" } },
        },
        winbar = winbar.active,
        inactive_winbar = winbar.inactive,
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { right = "" },
              padding = { left = 1, right = 0 },
              fmt = function(str)
                return " " .. str
              end,
            },
            {
              "filename",
              path = 1,
              fmt = function(filename)
                local folder = filename:match("^.+/") or ""
                if folder ~= "" then
                  folder = folder:sub(1, -2)
                  folder = folder:match("[^/]+$") or folder
                  filename = folder .. "/" .. filename:match("[^/]+$")
                end

                return assets.file .. " " .. filename
              end,
              color = { bg = "#EE99A0" },
              separator = { right = "" },
            },
          },
          lualine_b = {},
          lualine_c = {
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", hint = " ", info = " " },
              colored = false,
            },
          },
          lualine_x = {
            {
              "diff",
              symbols = { added = "  ", modified = " ", removed = " " },
              --[[ color = { bg = "#313244" }, ]]
              separator = { left = "" },
              colored = true,
            },
            {
              "branch",
              separator = { left = "" },
              color = { fg = "#1E2030", bg = "#F9E2AF" },
            },
          },
          lualine_y = {},
          lualine_z = {
            {
              dir,
              color = { bg = "#F0C6C6" },
              separator = { left = "" },
            },
            {
              "location",
              fmt = function()
                return "  " .. [[%l:%c]]
              end,
              separator = { left = "" },
              color = { bg = "#EE99A0" },
            },
          },
        },
        extensions = { "quickfix", "lazy", "mason", "neo-tree" },
      })
    end,
  },
}
