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
return require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'kabouzeid/nvim-lspinstall',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim',
    },
    config = function()
      require'config.lsp'
    end
  }
  -- use 'nvim-lua/lsp_extensions.nvim'
  -- use 'nvim-lua/lsp-status.nvim'

  -- Language support
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' },
    config = function()
      require'config.language'
    end
  }

  -- File manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function ()
      vim.g.nvim_tree_width = 40
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'config.treesitter'
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires ='nvim-treesitter/nvim-treesitter'
  }
  use {
    'nvim-treesitter/playground',
    requires ='nvim-treesitter/nvim-treesitter'
  }
  use {
    'p00f/nvim-ts-rainbow',
    requires ='nvim-treesitter/nvim-treesitter'
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
    config = function()
      require 'surround'.setup({ mappings_style = 'surround' })
    end,
  }
  use {
    'windwp/nvim-autopairs',
    after = { 'nvim-cmp' },
    config = function()
      require'nvim-autopairs'.setup({ check_ts = true })
      require'nvim-autopairs.completion.cmp'.setup({
        map_cr = true,
        map_complete = true,
        -- auto_select = true
        })
    end,
  }

  -- Looks
  use {
    'glepnir/dashboard-nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      vim.g.dashboard_default_executive = 'telescope'
    end
  }
  use {
    'mhartington/oceanic-next',
    config = function()
      vim.cmd('colorscheme OceanicNext')
      vim.cmd 'hi Normal guibg=NONE ctermbg=NONE'
      vim.cmd 'hi LineNr guibg=NONE ctermbg=NONE'
      vim.cmd 'hi SignColumn guibg=NONE ctermbg=NONE'
      vim.cmd 'hi EndOfBuffer guibg=NONE ctermbg=NONE'
    end
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require'config.blankline'
    end
  }
  use {
    'hoob3rt/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require'lualine'.setup({ options = {theme = 'oceanicnext'} })
    end,
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end,
  }

  -- Telescope (Fuzzy finding)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require'config.telescope'
    end,
  }
end)
