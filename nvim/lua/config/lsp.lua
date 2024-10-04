local servers = { "vimls", "lua_ls", "vtsls", "eslint", "stylelint_lsp", "cssls", "css_variables", "cssmodules_ls" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
})
require("neodev").setup()

local lspconfig = require("lspconfig")

vim.diagnostic.config({
  signs = false,
  update_in_insert = true,
  virtual_text = {
    space = 2,
    prefix = " ●",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  desc = "LSP Actions",
  callback = function(event)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { buffer = event.buf }

    -- Display documentation of the symbol under the cursor
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

    -- Jump to the definition
    vim.keymap.set("n", "gdo", vim.lsp.buf.definition, opts)

    -- Jump to the definition in new tab
    vim.keymap.set("n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)

    -- Jump to the definition in vertical split
    vim.keymap.set("n", "gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)

    -- Jump to declaration
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

    -- Displays a function's signature information
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    -- Lists all the implementations for the symbol under the cursor
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

    -- Renames all references to the symbol under the cursor
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

    -- Selects a code action available at the current cursor position
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)

    -- Format current file
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    vim.keymap.set("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set("n", "<space>wl", function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

    -- vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
  end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
  local config = { capabilities = capabilities }

  if server == "stylelint_lsp" then
    config.filetypes = { "css", "scss", "sass", "less" }
  elseif server == "cssls" then
    config.init_options = { provideFormatter = false }
  elseif server == "cssmodules_ls" then
    config.capabilities = { definitionProvider = false }
  end

  lspconfig[server].setup(config)
end

require("lspsaga").setup({
  symbol_in_winbar = { enable = false },
  diagnostic = { max_width = 0.5, max_show_width = 0.5 },
  lightbulb = { virtual_text = false },

  ui = {
    kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
    colors = { normal_bg = "#022746" },
    code_action = " ",
  },
})
