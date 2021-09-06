-- Bootstrap packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack_vscode/packer/start/packer.nvim"

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
local packer = require("packer")
local util = require("packer.util")
packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack_vscode"),
	compile_path = util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled_vscode.lua"),
	display = {
		non_interactive = true,
	},
})
return packer.startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

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

	-- Additional movements
	use({
		-- Manipulate parentheses, brackets etc
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	})
end)
