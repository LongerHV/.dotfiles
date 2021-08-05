-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Plugin specification
return require('packer').startup(function(use)
	-- LSP
	use {'neoclide/coc.nvim', branch = 'release'}
	use 'rafcamlet/coc-nvim-lua'
	-- use 'hrsh7th/nvim-compe'
	-- use 'neovim/nvim-lspconfig'
	-- use 'kyazdani42/nvim-tree.lua'

	-- Syntax highlighting + indents
	use 'sheerun/vim-polyglot'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Debugging
	-- use 'puremourning/vimspector'
	-- use 'mfussenegger/nvim-dap'

	-- Additional movements
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'b3nj5m1n/kommentary'
	use 'cohama/lexima.vim'
	use 'windwp/nvim-autopairs'

	-- Looks
	use 'mhinz/vim-startify'
	use 'mhartington/oceanic-next'
	use 'hoob3rt/lualine.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'ryanoasis/vim-devicons'
	use 'lukas-reineke/indent-blankline.nvim'

	-- Telescope (Fuzzy finding)
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
end)
