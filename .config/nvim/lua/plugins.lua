-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
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
return require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- LSP
	use({
		-- Autocomplete
		"hrsh7th/nvim-cmp",
		requires = {
			"neovim/nvim-lspconfig",
			"nvim-lua/lsp-status.nvim",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"kabouzeid/nvim-lspinstall",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",
		},
		config = function()
			local lsp_status = require("lsp-status")
			lsp_status.config({
				status_symbol = "",
				indicator_hint = "",
			})
			require("config.lsp")
		end,
	})
	-- use 'nvim-lua/lsp_extensions.nvim'
	-- use 'nvim-lua/lsp-status.nvim'

	-- Linting and formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
		config = function()
			require("config.language")
		end,
	})

	-- File manager
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			vim.g.nvim_tree_width = 40
			vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>NvimTreeToggle<cr>", {})
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})
	use({
		-- Additional objects (such as function, class, block etc)
		"nvim-treesitter/nvim-treesitter-textobjects",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"nvim-treesitter/playground",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		-- Different colours of nested parentheses
		"p00f/nvim-ts-rainbow",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		-- Smarter selections using treesitter
		"RRethy/nvim-treesitter-textsubjects",
		requires = "nvim-treesitter/nvim-treesitter",
		setup = function()
			require("nvim-treesitter.configs").setup({
				textsubjects = {
					enable = true,
					keymaps = {
						["."] = "textsubjects-smart",
						[";"] = "textsubjects-container-outer",
					},
				},
			})
		end,
	})

	-- Debugging
	-- use 'mfussenegger/nvim-dap'
	-- use 'rcarriga/nvim-dap-ui'
	-- use 'Pocco81/DAPInstall.nvim'

	-- Additional movements
	use({
		-- Use 'CTRL + /' to comment line or selection
		"b3nj5m1n/kommentary",
		config = function()
			vim.api.nvim_set_keymap("n", "", "<Plug>kommentary_line_default", {})
			vim.api.nvim_set_keymap("v", "", "<Plug>kommentary_visual_default<C-c>", {})
		end,
	})
	use({
		-- Manipulate parentheses, brackets etc
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	})
	use({
		-- Auto close brackets etc (with treesitter support)
		"windwp/nvim-autopairs",
		after = { "nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({ check_ts = true })
			require("nvim-autopairs.completion.cmp").setup({
				map_cr = true,
				map_complete = true,
				-- auto_select = true
			})
		end,
	})

	-- Looks
	use({
		-- Startpage
		"glepnir/dashboard-nvim",
		requires = "nvim-telescope/telescope.nvim",
		config = function()
			vim.g.dashboard_default_executive = "telescope"
		end,
	})
	use({
		-- Color theme
		"mhartington/oceanic-next",
		config = function()
			vim.cmd("colorscheme OceanicNext")
			-- Fix transparent background
			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
			vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
			vim.cmd("hi SignColumn guibg=NONE ctermbg=NONE")
			vim.cmd("hi EndOfBuffer guibg=NONE ctermbg=NONE")
		end,
	})
	use({
		-- Draw indentation lines (highlighting based on treesitter)
		"lukas-reineke/indent-blankline.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("config.blankline")
		end,
	})
	use({
		-- Status line
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/lsp-status.nvim" },
		config = function()
			require("lualine").setup({
				options = { theme = "oceanicnext" },
				sections = {
					lualine_x = { require("lsp-status").status, "encoding", "fileformat", "filetype" },
				},
			})
		end,
	})
	use({
		-- Color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- Telescope (Fuzzy finding)
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("config.telescope")
		end,
	})
end)
