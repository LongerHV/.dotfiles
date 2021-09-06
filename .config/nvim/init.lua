-- TODO
-- * Setup DAP (debugger)

vim.g.mapleader = " "

require("config.general")
if vim.g.vscode == nil then
	require("plugins")
	require("config.theme")
else
	require("plugins_vscode")
	vim.o.termguicolors = true
end
require("config.remaps")
