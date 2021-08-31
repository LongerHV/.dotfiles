local null_ls = require("null-ls")
null_ls.config({
	sources = {
		-- Python
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8,

		-- JS yaml html markdown
		null_ls.builtins.formatting.prettier,

		-- C/C++
		-- Formatting is handled by clangd language server
		-- null_ls.builtins.formatting.clang_format,

		-- Markdown
		null_ls.builtins.diagnostics.markdownlint,

		-- Lua
		-- cargo install stylua
		-- add ~/.cargo/bin to PATH
		null_ls.builtins.formatting.stylua,

		-- Spell checking
		null_ls.builtins.diagnostics.codespell.with({
			args = { "--builtin", "clear,rare,code", "-" },
		}),
	},
})
require("lspconfig")["null-ls"].setup({})
