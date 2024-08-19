
vim.cmd(':set number')
vim.cmd(':set relativenumber')

vim.cmd(':set spellsuggest+=10')

-- Indentation
vim.cmd(':set autoindent')
vim.cmd(':set expandtab')
vim.cmd(':set tabstop=4')
vim.cmd(':set shiftwidth=4')
vim.cmd(':set smarttab')

vim.cmd(':set copyindent')
vim.cmd(':set showmatch')
vim.cmd(':set ignorecase')
vim.cmd(':set smartcase')
vim.cmd(':set incsearch')

-- Don't start with all the folds folded 
-- Used most for norg
vim.cmd(':set foldlevelstart=99')

vim.cmd(':set termguicolors')

vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

vim.cmd(':set undodir=~/.local/state/nvim/undo-dir')
vim.cmd(':set undofile')

