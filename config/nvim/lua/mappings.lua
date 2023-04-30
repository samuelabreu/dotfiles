vim.opt.colorcolumn = "120"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.foldmethod = 'expr'
vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true
vim.opt.title = false
vim.opt.shiftwidth = 2
vim.opt.cursorline = true
vim.opt.undodir = '/tmp/nvim_undodir'
vim.opt.undofile = true
vim.opt.writebackup = false
vim.opt.numberwidth = 4
vim.opt.scrolloff = 8
vim.opt.laststatus = 3
vim.opt.relativenumber = true

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('n', '<leader>w', ':w<cr>')
vim.keymap.set('n', 'Q', ':q<cr>')
vim.keymap.set('n', 'H', ':bprevious<cr>')
vim.keymap.set('n', 'L', ':bnext<cr>')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<leader>tn', ':tabnew<cr>')
vim.keymap.set('n', '<leader>to', ':tabonly<cr>')
vim.keymap.set('n', '<leader>tc', ':tabclose<cr>')
vim.keymap.set('n', '<leader>tm', ':tabmove<cr>')

vim.keymap.set('n', 'gf', ':edit <cfile><cr>')
