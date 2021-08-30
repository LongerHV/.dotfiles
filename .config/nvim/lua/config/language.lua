-- Indent size
vim.cmd('autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab')
vim.cmd('autocmd FileType lua setlocal tabstop=2 shiftwidth=2 expandtab')
vim.cmd 'filetype indent plugin on'

-- Diagnostics and formatting
local null_ls = require('null-ls')
null_ls.config({
  sources = {
    -- Python
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,

    -- JS yaml html markdown
    null_ls.builtins.formatting.prettier,

    -- C/C++
    null_ls.builtins.formatting.clang_format,

    -- Markdown
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.markdownlint,
  }
})
require('lspconfig')['null-ls'].setup({})

-- Snippets
local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif luasnip and luasnip.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif luasnip and luasnip.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    else
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
