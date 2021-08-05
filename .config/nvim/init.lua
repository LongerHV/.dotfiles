vim.g.mapleader = " "

require "plugins"
require "config.general"
vim.cmd('source $HOME/.config/nvim/plug-config/coc.vim')
require "config.coc"
require "config.theme"
require "config.treesitter"
require "config.remaps"
require "config.telescope"
require('nvim-autopairs').setup{}
-- require "config.vimspector"
