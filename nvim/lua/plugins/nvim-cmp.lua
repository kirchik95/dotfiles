return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",

    "rafamadriz/friendly-snippets",
    "roginfarrer/cmp-css-variables",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    local function find_css_variable_files()
      local search_dir = "src"
      local variable_files = {}
      local file_pattern = "variables%.css$"
      local files = vim.fn.globpath(search_dir, "**/" .. file_pattern, false, true)
      for _, file in ipairs(files) do
        table.insert(variable_files, file)
      end
      if #variable_files > 0 then
        vim.g.css_variables_files = variable_files
      else
        vim.g.css_variables_files = {}
      end
    end

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          symbol_map = { Copilot = "" },

          before = function(_, vim_item)
            return vim_item
          end,
        }),
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = "nvim_lsp" },
        { name = "vsnip" },
        -- { name = "css-variables" },
      }, {
        { name = "buffer" },
      }),
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = "buffer" },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- find_css_variable_files()
    vim.g.vsnip_snippet_dir = "~/.config/nvim/snippets"
  end,
}
