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
		null_ls.builtins.formatting.clang_format,

		-- Markdown
		null_ls.builtins.diagnostics.write_good,
		null_ls.builtins.diagnostics.markdownlint,

		-- Lua
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.luacheck,
	},
})
require("lspconfig")["null-ls"].setup({})
