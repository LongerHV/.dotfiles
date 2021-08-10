-- TODO
-- * Replace CoC with builtin LSP
-- * Setup DAP (debugger)
-- * Remove polyglot (when python indents work well in Treesitter)

-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Plugin specification
return require('packer').startup(
	function(use)
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

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
		use {
			'nvim-treesitter/nvim-treesitter-textobjects',
			requires = 'nvim-treesitter/nvim-treesitter'
		}
		use {
			'nvim-treesitter/playground',
			requires = 'nvim-treesitter/nvim-treesitter'
		}

		-- Debugging
		-- use 'puremourning/vimspector'
		-- use 'mfussenegger/nvim-dap'
		-- use 'rcarriga/nvim-dap-ui'
		-- use 'Pocco81/DAPInstall.nvim'

		-- Additional movements
		use 'blackCauldron7/surround.nvim'
		use 'tpope/vim-repeat'
		use 'b3nj5m1n/kommentary'
		use 'windwp/nvim-autopairs'

		-- Looks
		use 'glepnir/dashboard-nvim'
		use 'mhartington/oceanic-next'
		use 'hoob3rt/lualine.nvim'
		use 'kyazdani42/nvim-web-devicons'
		use 'lukas-reineke/indent-blankline.nvim'
		use 'norcalli/nvim-colorizer.lua'
		use {
			'p00f/nvim-ts-rainbow',
			requires = 'nvim-treesitter/nvim-treesitter'
		}

		-- Telescope (Fuzzy finding)
		use {
			'nvim-telescope/telescope.nvim',
			requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
		}
	end
)
