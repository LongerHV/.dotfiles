-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

-- Plugin specification
return require('packer').startup(
  function(use)
    -- Packeage manager
    use 'wbthomason/packer.nvim'

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      require = {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'kabouzeid/nvim-lspinstall',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'onsails/lspkind-nvim',
      },
      config = require'config.lsp'.config()
    }
    -- use 'nvim-lua/lsp_extensions.nvim'
    -- use 'nvim-lua/lsp-status.nvim'

    -- Language support
    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' },
      after = {'neovim/nvim-lspconifg'},
      config = require'config.language'.config_diagnostics(),
    }

    -- File manager
    use 'kyazdani42/nvim-tree.lua'

    -- Treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/playground',
        'p00f/nvim-ts-rainbow',
      },
      config = require'config.treesitter'.config(),
    }

    -- Debugging
    -- use 'mfussenegger/nvim-dap'
    -- use 'rcarriga/nvim-dap-ui'
    -- use 'Pocco81/DAPInstall.nvim'

    -- Additional movements
    use 'tpope/vim-repeat'
    use 'b3nj5m1n/kommentary'
    use {
      'blackCauldron7/surround.nvim',
      config = require 'surround'.setup({ mappings_style = 'surround' }),
    }
    use {
      'windwp/nvim-autopairs',
      config = require'nvim-autopairs'.setup({ check_ts = true }),
    }

    -- Looks
    use 'glepnir/dashboard-nvim'
    use 'mhartington/oceanic-next'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
      'hoob3rt/lualine.nvim',
      config = require'lualine'.setup({ options = {theme = 'oceanicnext'} }),
    }
    use {
      'norcalli/nvim-colorizer.lua',
      config = require'colorizer'.setup(),
    }

    -- Telescope (Fuzzy finding)
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = require'config.telescope'.config(),
    }
  end
)
