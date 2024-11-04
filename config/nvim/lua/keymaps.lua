-- local mapper = function(mode, key, result, desc) vim.keymap.set(mode, key, result,
--     { noremap = true, silent = true, desc = desc }) end

-- mapper('i', '<Tab><Tab>', '<Right>')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Resize splitbuffers
-- vim.keymap.set('n', '<C-l>', ':exe "vertical resize +5"<CR>', { desc = 'Resize vertial +5' })
-- vim.keymap.set('n', '<C-h>', ':exe "vertical resize -5"<CR>', { desc = 'Resize vertical -5' })
vim.keymap.set('n', '<C-k>', ':exe "resize +5"<CR>', { desc = 'Resize horizontal +5' })
vim.keymap.set('n', '<C-j>', ':exe "resize -5"<CR>', { desc = 'Resize vertlical -5' })

-- Switch buffers
vim.keymap.set('n', '<Tab>', '<C-W>w', { desc = 'Swich to next buffer' })
vim.keymap.set('n', '<S-Tab>', '<C-W>W', { desc = 'Swich to previous buffer' })

-- Switch tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'Open new tab' })

-- Insert empty line under/above current line
vim.keymap.set('n', '\\o', 'o<Esc>', { desc = 'Inser empty line under current' })
vim.keymap.set('n', '\\O', '<S-O><Esc>', { desc = 'Inser empty line above current' })

-- Markdown preview in litemdview
vim.keymap.set('n', '<A-m>', ':silent !litemdview %<CR>', { desc = 'Markdown preview of current file' })

-- Git/LazyGit
vim.keymap.set('n', '<C-g>', ':LazyGit<CR>', { desc = 'LazyGit' })
