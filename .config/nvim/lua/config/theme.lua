-- Status line
require'lualine'.setup {
	options = {theme = 'oceanicnext'}
}

-- Color theme
vim.o.termguicolors = true
vim.cmd 'colorscheme OceanicNext'
vim.o.cursorline = true
vim.o.colorcolumn = '80'

-- Fix transparency
vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
vim.cmd 'hi LineNr guibg=NONE ctermbg=NONE'
vim.cmd 'hi SignColumn guibg=NONE ctermbg=NONE'
vim.cmd 'hi EndOfBuffer guibg=NONE ctermbg=NONE'

-- Indent line
require'indent_blankline'.setup {
	use_treesitter = true,
	show_current_context = true,
	context_patterns = {
		'class', 'function', 'method', 'for_statement',
		'try_statement', 'except_clause', 'finally_clause',
		'while_statement', 'if_statement',
	},
	filetype_exclude = {'dashboard', 'coc-explorer'},
}

-- Colorizer
require'colorizer'.setup()
