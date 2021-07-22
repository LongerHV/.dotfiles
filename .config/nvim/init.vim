" Dependencies:
" python
" python-pynvim
" python-debugpy
" npm
" nodejs

" TODO:
" * vimspector (debugging)

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
	" Plug 'sheerun/vim-polyglot'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'puremourning/vimspector'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'mhartington/oceanic-next'
	" Plug 'vim-airline/vim-airline'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'yggdroot/indentline'
	Plug 'cohama/lexima.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'luochen1990/rainbow'
	Plug 'mhinz/vim-startify'

	" Experimental
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	call plug#end()

	" Extensions
	let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-yaml', 'coc-vimlsp', 'coc-prettier', 'coc-explorer', 'coc-lists', 'coc-pydocstring', 'coc-markdownlint']
	let g:vimspector_install_gadgets = ['debugpy']

	" Leader
	let mapleader = ' '

	" Line numbering
	set number relativenumber

	" No line wrapping
	set nowrap

	" Better markdown
	set conceallevel=0
	let g:indentLine_conceallevel = 0

	" Mouse
	set mouse=a
	
	" Search
	set ignorecase smartcase

	" Lualine
lua << EOF
require'lualine'.setup {
	options = {theme = 'oceanicnext'}
}
EOF

	" Tree-sitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

	" Theme
	syntax enable
	if (has("termguicolors"))
		set termguicolors
	endif
	" let g:airline_theme = 'oceanicnext'
	colorscheme OceanicNext
	set cursorline
	set colorcolumn=80

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

	" Vimspector
	let g:vimspector_enable_mappings = 'HUMAN'

	" Startify
	let g:startify_change_to_dir = 0
	let s:startify_ascii_header = [
	 \ '                                        ▟▙            ',
	 \ '                                        ▝▘            ',
	 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
	 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
	 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
	 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
	 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
	 \ '',
	 \]
	let g:startify_custom_header = map(s:startify_ascii_header +
		\ startify#fortune#quote(), '"   ".v:val')

	" Remaps
	nnoremap <leader>t :CocCommand explorer<CR>
	nnoremap <C-P> :Telescope find_files<CR>
	map  <plug>NERDCommenterToggle

	" Quick Fix lists
	nnoremap <C-k> :cnext<CR>
	nnoremap <C-j> :cprev<CR>
	nnoremap <C-q> :call ToggleQFList(1)<CR>
	nnoremap <C-l> :call ToggleQFList(0)<CR>

	" Copy and paste (system clipboard)
	vnoremap <leader>y "+y
	nnoremap <leader>y "+yy
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P

	" Telescope
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	nnoremap <leader>ft <cmd>Telescope treesitter<cr>
endif

