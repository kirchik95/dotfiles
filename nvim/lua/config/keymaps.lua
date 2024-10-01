local utils = require("utils")

local map = utils.safe_keymap_set

local opts = { noremap = true, silent = true }

map("n", "te", ":tabedit")
map("n", "<tab>", ":tabnext<Return>", opts)
map("n", "<s-tab>", ":tabprev<Return>", opts)

map("n", "<C-w><", ":vertical resize -30<CR>", opts)
map("n", "<C-w>>", ":vertical resize +30<CR>", opts)

map("n", "<C-w><up>", "10<C-w>+", opts)
map("n", "<C-w><down>", "10<C-w>-", opts)

-- nvim-tree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- map("n", "<leader>fe", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
--

local wk = require("which-key")

-- CopilotChat
wk.add({
  { "<leader>c",   group = "Copilot" },
  { "<leader>cc",  group = "Copilot" },
  { "<leader>ccR", "<cmd>CopilotChatOptimize<cr>",      desc = "CopilotChat - Optimize code" },
  { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>",      desc = "CopilotChat - Correct spelling" },
  { "<leader>cce", "<cmd>CopilotChatExplain<cr>",       desc = "CopilotChat - Explain code" },
  { "<leader>ccf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix diagnostic" },
  { "<leader>ccl", "<cmd>CopilotChatReset<cr>",         desc = "CopilotChat - Reset chat history and clear buffer" },
  { "<leader>ccr", "<cmd>CopilotChatReview<cr>",        desc = "CopilotChat - Review code" },
  { "<leader>cct", "<cmd>CopilotChatTests<cr>",         desc = "CopilotChat - Generate tests" },
  { "<leader>ccv", "<cmd>CopilotChat<cr>",              desc = "CopilotChat - Open in vertical split" },
  { "<leader>ccw", "<cmd>CopilotChatWording<cr>",       desc = "CopilotChat - Improve wording" },
  { "<leader>ccx", "<cmd>CopilotChatInPlace<cr>",       desc = "CopilotChat - Run in-place code" },
})

-- Telescope
wk.add({
  { "<leader>f",  group = "file" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>",                   desc = "Find Buffers" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>",                desc = "Find File" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
  { "<leader>fh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Tags" },
  { "<leader>fw", "<cmd>Telescope grep_string<cr>",               desc = "Find Word" },
  { "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find Current" },
  { "<leader>gs", "<cmd>Telescope git_status<cr>",                desc = "Git status" },
})
