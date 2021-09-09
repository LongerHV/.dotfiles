local remap = vim.api.nvim_set_keymap
local buf_remap = vim.api.nvim_buf_set_keymap
local lsp_status = require("lsp-status")

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	buf_remap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_remap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_remap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_remap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_remap(bufnr, "n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_remap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_remap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_remap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_remap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_remap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_remap(bufnr, "n", "<leader>o", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

	lsp_status.on_attach(client)
end

-- Configure lua language server for neovim development
local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = "LuaJIT",
			path = vim.split(package.path, ";"),
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { "vim" },
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			},
		},
	},
}

-- config that activates keymaps and enables snippet support
local function make_config()
	local capabilities = lsp_status.capabilities
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return {
		-- enable snippet support
		capabilities = capabilities,
		-- map buffer local keybindings when the language server attaches
		on_attach = on_attach,
	}
end

-- LSP Install
local function setup_servers()
	require("lspinstall").setup()

	-- local required_servers = { "python", "lua", "json", "yaml", "dockerfile" }
	local installed_servers = require("lspinstall").installed_servers()
	table.insert(installed_servers, "clangd")

	--[[ for _, server in pairs(required_servers) do
		if not vim.tbl_contains(installed_servers, server) then
			require("lspinstall").install_server(server)
		end
	end ]]

	for _, server in pairs(installed_servers) do
		local config = make_config()
		if server == "lua" then
			config.settings = lua_settings
		elseif server == "clangd" then
			config.filetypes = { "c", "cpp" }
		end

		require("lspconfig")[server].setup(config)
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- nvim-cmp setup
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	-- Pictograms
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
			return vim_item
		end,
	},
})

-- Snippets
local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local luasnip = prequire("luasnip")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif luasnip and luasnip.expand_or_jumpable() then
		return t("<Plug>luasnip-expand-or-jump")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif luasnip and luasnip.jumpable(-1) then
		return t("<Plug>luasnip-jump-prev")
	else
		return t("<S-Tab>")
	end
end

remap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
remap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
remap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
remap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
remap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
remap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
