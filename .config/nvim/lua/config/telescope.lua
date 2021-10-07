local telescope = require("telescope")
local utils = require("telescope.utils")

telescope.setup({
	defaults = {
		layout_config = {
			horizontal = {
				width = 0.9,
			},
		},
	},
	pickers = {
		file_browser = {
			cwd = utils.buffer_dir(),
		},
	},
})

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>Telescope<cr>", { noremap = true })
