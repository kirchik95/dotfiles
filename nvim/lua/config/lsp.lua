local servers = { "vimls", "lua_ls", "ts_ls", "eslint", "cssls", "cssmodules_ls", "stylelint_lsp" }

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
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gdo", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gdt", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
    --    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)

    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
    vim.keymap.set("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "go", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(servers) do
  local config = { capabilities = capabilities }

  if server == "stylelint_lsp" then
    config.filetypes = { "css", "scss", "sass", "less" }
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
