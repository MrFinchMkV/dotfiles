-- Trim whitespaces at the of lines
vim.cmd([[
  autocmd BufWritePre <buffer> :%s/\s\+$//e
]])

-- Format on save
vim.cmd([[
  autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
]])
