vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>oe', function()
  vim.cmd('Ex')
end, { desc = "[O]pen [E]xplorer (Netrw)" });

-- Move current line down one line and adjust indentation in normal mode
vim.api.nvim_set_keymap('n', '<A-j>', ':m .+1<CR>==', { noremap = true })

-- Move current line two lines up and adjust indentation in normal mode
vim.api.nvim_set_keymap('n', '<A-k>', ':m .-2<CR>==', { noremap = true })

-- Move current line down one line, adjust indentation, and return to insert mode
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { noremap = true })

-- Move current line two lines up, adjust indentation, and return to insert mode
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { noremap = true })

-- Move selected lines down one line and adjust indentation in visual mode
vim.api.nvim_set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", { noremap = true })

-- Move selected lines two lines up and adjust indentation in visual mode
vim.api.nvim_set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", { noremap = true })

-- Split pane movements
vim.api.nvim_set_keymap('n', 'mh', "<C-w>h", { silent = true, desc = "[mh] Move to left pane" });
vim.api.nvim_set_keymap('n', 'mj', "<C-w>j", { silent = true, desc = "[mj] Move to above pane" });
vim.api.nvim_set_keymap('n', 'mk', "<C-w>k", { silent = true, desc = "[mk] Move to below pane" });
vim.api.nvim_set_keymap('n', 'ml', "<C-w>l", { silent = true, desc = "[ml] Move to right pane" });

-- Vertical movements
vim.api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { silent = true, desc = "[<C-d>] Jump half page down and center" });
vim.api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { silent = true, desc = "[<C-u>] Jump half page up and center" });

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Delete & Yank extras
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", {desc="Delete without yanking"})
vim.keymap.set("v", "<leader>p", "\"_dP", {desc="Replace-paste without yanking"})

-- Pairs completion
vim.api.nvim_set_keymap('i', '"', '""<left>', {silent=true, noremap=true, desc="Complete double quotes"})
vim.api.nvim_set_keymap('i', '\'', '\'\'<left>', {silent=true, noremap=true, desc="Complete single quotes"})
vim.api.nvim_set_keymap('i', '`', '``<left>', {silent=true, noremap=true, desc="Complete backticks"})
vim.api.nvim_set_keymap('i', '(', '()<left>', {silent=true, desc="Complete parentheses"})
vim.api.nvim_set_keymap('i', '[', '[]<left>', {silent=true, desc="Complete brackets"})
vim.api.nvim_set_keymap('i', '{', '{}<left>', {silent=true, desc="Complete curlies"})
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', {silent=true, desc="Complete curlies newline"})
vim.api.nvim_set_keymap('i', '\\"', '\\"', {silent=true, noremap=true, desc="Avoid completion when escaping double quotes"})
vim.api.nvim_set_keymap('i', '\\\'', '\\\'', {silent=true, noremap=true, desc="Avoid competion when escaping single quotes"})
vim.api.nvim_set_keymap('i', '\\`', '`', {silent=true, noremap=true, desc="Avoid competion when escaping backticks"})
vim.api.nvim_set_keymap('i', '\\(', '\\(', {silent=true, noremap=true, desc="Avoid completion when escaping parentheses"})
vim.api.nvim_set_keymap('i', '\\[', '\\[', {silent=true, noremap=true, desc="Avoid completion when escaping brackets"})
vim.api.nvim_set_keymap('i', '\\{', '\\{', {silent=true, noremap=true, desc="Avoid completion when escaping curlies"})
