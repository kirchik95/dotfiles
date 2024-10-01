return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      local chatgpt = require("chatgpt")
      local wk = require("which-key")

      chatgpt.setup({
        actions_paths = { "~/.config/nvim/helpers/actions.json" },
        open_ai_params = {
          model = "gpt-4o",
        },
        openai_edit_params = {
          model = "gpt-4o",
        },
      })

      wk.add({
        {
          mode = { "n", "v" },
          { "<leader>pa", "<cmd>ChatGPTRun add_tests<CR>",                 desc = "Add Tests" },
          { "<leader>pd", "<cmd>ChatGPTRun docstring<CR>",                 desc = "Docstring" },
          { "<leader>pe", "<cmd>ChatGPTEditWithInstruction<CR>",           desc = "Edit with instruction" },
          { "<leader>pf", "<cmd>ChatGPTRun fix_bugs<CR>",                  desc = "Fix Bugs" },
          { "<leader>pg", "<cmd>ChatGPTRun grammar_correction<CR>",        desc = "Grammar Correction" },
          { "<leader>ph", "<cmd>ChatGPTRun roxygen_edit<CR>",              desc = "Roxygen Edit" },
          { "<leader>pk", "<cmd>ChatGPTRun keywords<CR>",                  desc = "Keywords" },
          { "<leader>pl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
          { "<leader>po", "<cmd>ChatGPTRun optimize_code<CR>",             desc = "Optimize Code" },
          { "<leader>pr", "<cmd>ChatGPTRun refactor_code<CR>",             desc = "Refactor Code" },
          { "<leader>ps", "<cmd>ChatGPTRun summarize<CR>",                 desc = "Summarize" },
          { "<leader>pt", "<cmd>ChatGPTRun translate<CR>",                 desc = "Translate" },
          { "<leader>px", "<cmd>ChatGPTRun explain_code<CR>",              desc = "Explain Code" },
        },
        { "<leader>p",  group = "ChatGPT",  mode = "v" },
        { "<leader>pc", "<cmd>ChatGPT<CR>", desc = "ChatGPT", mode = "v" },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
