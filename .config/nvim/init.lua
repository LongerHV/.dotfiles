vim.g.mapleader = " "

require "plugins"
require "config.general"
require "config.coc"
require "config.treesitter"
require "config.theme"
require "config.remaps"

vim.cmd('source $HOME/.config/nvim/plug-config/coc.vim')
