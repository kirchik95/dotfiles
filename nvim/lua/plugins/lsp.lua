return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
      { "nvimdev/lspsaga.nvim" },
      { "onsails/lspkind.nvim" },
    },
  },
  { "folke/neodev.nvim" },
  { "dmmulroy/ts-error-translator.nvim" },
}
