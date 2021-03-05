" Dependencies:
" python
" python-pynvim
" npm
" nodejs

" TODO:
" * vimspector (debugging)
" * Coc puts weird indents in python

" Embedded in VSCode
if exists('g:vscode')
	call plug#begin('~/.config/nvim/plugged')
	Plug 'tpope/vim-surround'
	call plug#end()

" Standalone
else
	" Plugins
	call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'mhartington/oceanic-next'
	Plug 'vim-airline/vim-airline'
	Plug 'scrooloose/nerdcommenter'
	Plug 'yggdroot/indentline'
	Plug 'cohama/lexima.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'luochen1990/rainbow'
	Plug 'sheerun/vim-polyglot'
	" Plug 'puremourning/vimspector'
	call plug#end()

	" Extensions
	let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-vimlsp', 'coc-prettier', 'coc-explorer', 'coc-lists']

	" Leader
	let mapleader = ' '

	" Line numbering
	set number relativenumber

	" Mouse
	set mouse=a
	
	" Search
	set ignorecase smartcase

	" Theme
	syntax enable
	if (has("termguicolors"))
		set termguicolors
	endif
	let g:airline_theme = 'oceanicnext'
	colorscheme OceanicNext

	" Fix transparency
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr guibg=NONE ctermbg=NONE
	hi SignColumn guibg=NONE ctermbg=NONE
	hi EndOfBuffer guibg=NONE ctermbg=NONE
	
	" Nerd Commenter
	let g:NERDSpaceDelims = 1
	let g:NERDDefaultAlign = 'left'
	let g:NERDTrimTrailingWhitespace = 1

	" CoC config
	source $HOME/.config/nvim/plug-config/coc.vim

	" Remaps
	nnoremap <leader>t :CocCommand explorer<CR>
	nnoremap <C-P> :CocList files<CR>
	map  <plug>NERDCommenterToggle

	vnoremap <leader>y "+y
	map <leader>y "+yy
	map <leader>yy "+yy
	map <leader>p "+p
	map <leader>P "+P
endif

