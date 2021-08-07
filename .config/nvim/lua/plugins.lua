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
	-- use 'neovim/nvim-lspconfig'
	-- use 'nvim-lua/completion-nvim'
	-- use 'nvim-lua/lsp_extensions.nvim'
	-- use 'nvim-lua/lsp-status.nvim'
	-- use 'kyazdani42/nvim-tree.lua'

	-- Syntax highlighting + indents
	use 'sheerun/vim-polyglot'
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	-- use 'nvim-treesitter/playground'

	-- Debugging
	-- use 'puremourning/vimspector'
	-- use 'mfussenegger/nvim-dap'

	-- Additional movements
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat'
	use 'b3nj5m1n/kommentary'
	use 'windwp/nvim-autopairs'

	-- Looks
	use 'glepnir/dashboard-nvim'
	use 'mhartington/oceanic-next'
	use 'hoob3rt/lualine.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'ryanoasis/vim-devicons'
	use 'lukas-reineke/indent-blankline.nvim'
	use 'norcalli/nvim-colorizer.lua'

	-- Telescope (Fuzzy finding)
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
end)
