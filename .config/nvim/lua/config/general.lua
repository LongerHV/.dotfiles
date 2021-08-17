-- Line numbering
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)
vim.api.nvim_win_set_option(0, 'wrap', false)

-- Better Markdown
vim.api.nvim_set_option('conceallevel', 0)

-- Mouse
vim.api.nvim_set_option('mouse', 'a')

-- Search case
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('smartcase', true)

-- Syntax highlighting
vim.o.syntax = 'enable'

-- Start page
vim.g.dashboard_default_executive = 'telescope'

-- Surround
require 'surround'.setup{
	mappings_style = 'surround'
}

-- Indent size
vim.cmd('autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab')
