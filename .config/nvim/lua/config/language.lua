-- Linting
require('lint').linters_by_ft = {
  python = {'flake8',},
}

vim.cmd 'autocmd BufWritePost,BufEnter,InsertLeave,TextChanged <buffer> lua require(\'lint\').try_lint()'

-- Formatting
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    c = {
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
        }
        end
    },
    cpp = {
      -- clang-format
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
        }
      end
    },
    python = {
      -- autopep8
      function()
        return {
          exe = "autopep8",
          args = {"-"},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
        }
      end
    },
  }
})
