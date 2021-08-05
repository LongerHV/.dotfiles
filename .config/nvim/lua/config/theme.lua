-- Status line
require'lualine'.setup {
	options = {theme = 'oceanicnext'}
}

-- Color theme
vim.o.syntax = 'enable'
vim.o.termguicolors = true
vim.cmd 'colorscheme OceanicNext'
vim.o.cursorline = true
vim.o.colorcolumn = '80'

-- Fix transparency
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'hi LineNr guibg=NONE ctermbg=NONE'
vim.cmd 'hi SignColumn guibg=NONE ctermbg=NONE'
vim.cmd 'hi EndOfBuffer guibg=NONE ctermbg=NONE'
