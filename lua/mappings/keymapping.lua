local map = vim.keymap

local opts = {silent = true, noremap = true}

-- File explorer
map.set('n', '<leader>ps', vim.cmd.Ex)

-- Window and Pane navigation
map.set('n', '<C-h>', '<C-w>h', opts)
map.set('n', '<C-j>', '<C-w>j', opts)
map.set('n', '<C-k>', '<C-w>k', opts)
map.set('n', '<C-l>', '<C-w>l', opts)
map.set('n', '<C->', '<C-w>', opts)

-- Indenting
map.set('v', '<', '<gv')
map.set('v', '>', '>gv')

-- Comments
vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', { noremap = false })
vim.api.nvim_set_keymap('v', '<C-_>', 'gc', { noremap = false })

-- Default experience
map.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Dealing with word wrap
map.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic
map.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
