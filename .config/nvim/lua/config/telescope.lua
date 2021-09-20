local telescope = require("telescope")

telescope.setup({ defaults = { layout_config = { horizontal = { width = 0.9 } } } })
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>fe",
	"<cmd>lua require('telescope.builtin').file_browser({cwd = require('telescope.utils').buffer_dir()})<cr>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>Telescope<cr>", { noremap = true })
