return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "frappe",

      integrations = {
        neotree = true,
      },
      styles = {
        comments = {},
        conditionals = {},
      },
      highlight_overrides = {
        frappe = function(frappe)
          return {
            WinSeparator = { fg = frappe.crust, bg = "NONE" },
          }
        end,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
