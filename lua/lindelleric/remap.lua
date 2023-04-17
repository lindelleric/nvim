vim.g.mapleader = " "


-- -- windows movements
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


-- nvim-tree
vim.keymap.set("n", "<leader>e", ":Neotree reveal<cr>")

-- Bufferline
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext <cr>")
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev <cr>")
vim.keymap.set("n", "<Leader>db", ":bdelete <cr>")

-- Set spelling keybinds
vim.keymap.set("n", "<leader>sv", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=sv')
end)

vim.keymap.set("n", "<leader>en", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=en')
end)

