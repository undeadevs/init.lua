-- vim.opt.shell = 'pwsh'
-- vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
-- vim.opt.shellxquote = ''

if vim.env.SHELL=="C:\\msys64\\usr\\bin\\bash.exe" then
	vim.opt.shell = "bash"
	vim.opt.shellcmdflag = "-c"
	vim.opt.shellxquote = "("
	vim.opt.shellslash = true
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- vim.cmd.colorscheme('clarity-dark')
vim.cmd.highlight('Normal', 'guibg=none')
vim.cmd.highlight('NonText', 'guibg=none')
vim.cmd.highlight('Normal', 'ctermbg=none')
vim.cmd.highlight('NonText', 'ctermbg=none')

require('undeadevs.plugins')
require('undeadevs.opts')
require('undeadevs.keymaps')

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
