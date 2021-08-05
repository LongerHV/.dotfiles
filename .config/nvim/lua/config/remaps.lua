-- Commenting
vim.api.nvim_set_keymap("n", "", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "", "<Plug>kommentary_visual_default<C-c>", {})

-- Quick Fix lists
vim.api.nvim_set_keymap('n', '<C-k>', ':cnext<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':cprev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-q>', ':call ToggleQFList(1)<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':call ToggleQFList(0)<CR>', {noremap = true})

-- Copy and paste
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>y', '"+yy', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>P', '"+P', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- Keep it centered
vim.api.nvim_set_keymap('n', 'n', 'nzz', {noremap = true})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {noremap = true})
vim.api.nvim_set_keymap('n', 'J', 'Jzz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '{', '{zz', {noremap = true})
vim.api.nvim_set_keymap('n', '}', '}zz', {noremap = true})
vim.api.nvim_set_keymap('n', '(', '(zz', {noremap = true})
vim.api.nvim_set_keymap('n', ')', ')zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[[', '[[zz', {noremap = true})
vim.api.nvim_set_keymap('n', '[]', '[]zz', {noremap = true})
vim.api.nvim_set_keymap('n', ']]', ']]zz', {noremap = true})
vim.api.nvim_set_keymap('n', '][', '][zz', {noremap = true})

-- Add relative jumps to jumplist
vim.api.nvim_set_keymap('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . \'k\'', {noremap = true, expr = true})
vim.api.nvim_set_keymap('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . \'j\'', {noremap = true, expr = true})

-- Moving text
vim.api.nvim_set_keymap('v', '<C-j>', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', '<C-k>', ':m \'<-2<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':m .+1<CR>==', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':m .-2<CR>==', {noremap = true})

-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>Telescope registers<cr>', {noremap = true})
