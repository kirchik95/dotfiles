return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<CR>",  desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<CR>",    desc = "CopilotChat - Generate tests" },
      { "<leader>ccr", "<cmd>CopilotChatReview<CR>",   desc = "CopilotChat - Review code" },
      { "<leader>ccR", "<cmd>CopilotChatOptimize<CR>", desc = "CopilotChat - Optimize code" },
      { "<leader>ccS", "<cmd>CopilotChatSpelling<CR>", desc = "CopilotChat - Correct spelling" },
      { "<leader>ccw", "<cmd>CopilotChatWording<CR>",  desc = "CopilotChat - Improve wording" },
      {
        "<leader>ccv",
        ":CopilotChat",
        mode = "x",
        desc = "CopilotChat - Open in vertical split",
      },
      {
        "<leader>ccx",
        ":CopilotChatInPlace<cr>",
        mode = "x",
        desc = "CopilotChat - Run in-place code",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "CopilotChat - Fix diagnostic",
      },
      {
        "<leader>ccl",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "CopilotChat - Reset chat history and clear buffer",
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
