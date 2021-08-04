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

	" LSP
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Syntax highlighting + indents
	Plug 'sheerun/vim-polyglot'
	" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" Debugging
	Plug 'puremourning/vimspector'

	" Additional movements / bindings
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'scrooloose/nerdcommenter'
	" Plug 'terrortylor/nvim-comment'
	Plug 'cohama/lexima.vim'

	" Looks
	Plug 'mhinz/vim-startify'
	Plug 'mhartington/oceanic-next'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'luochen1990/rainbow'
	" Plug 'p00f/nvim-ts-rainbow'
	Plug 'ryanoasis/vim-devicons'
	Plug 'yggdroot/indentline'

	" Telescope (Fuzzy finding)
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'

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
" lua << EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   indent = { enable = true },
"   highlight = { enable = true, additional_vim_regex_highlighting = false },
" }
" EOF

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

	" Copy and paste
	vnoremap <leader>y "+y
	nnoremap <leader>y "+yy
	vnoremap <leader>p "+p
	vnoremap <leader>P "+P
	nnoremap <leader>p "+p
	nnoremap <leader>P "+P
	nnoremap Y y$

	" Keep it centered
	nnoremap n nzz
	nnoremap N Nzz
	nnoremap J Jzz
	nnoremap <C-i> <C-i>zz
	nnoremap <C-o> <C-o>zz
	nnoremap <C-u> <C-u>zz
	nnoremap <C-d> <C-d>zz
	nnoremap { {zz
	nnoremap } }zz
	nnoremap ( (zz
	nnoremap ) )zz
	nnoremap [[ [[zz
	nnoremap [] []zz
	nnoremap ]] ]]zz
	nnoremap ][ ][zz

	" Add relative jumps to jumplist
	nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
	nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

	" Moving text
	vnoremap <C-j> :m '>+1<CR>gv=gv
	vnoremap <C-k> :m '<-2<CR>gv=gv
	inoremap <C-j> <esc>:m .+1<CR>==
	inoremap <C-k> <esc>:m .-2<CR>==
	nnoremap <C-j> :m .+1<CR>==
	nnoremap <C-k> :m .-2<CR>==

	" Telescope
	nnoremap <leader>ff <cmd>Telescope find_files<cr>
	nnoremap <leader>fg <cmd>Telescope live_grep<cr>
	nnoremap <leader>fb <cmd>Telescope buffers<cr>
	nnoremap <leader>fh <cmd>Telescope help_tags<cr>
	nnoremap <leader>ft <cmd>Telescope treesitter<cr>
	nnoremap <leader>fr <cmd>Telescope registers<cr>
endif

