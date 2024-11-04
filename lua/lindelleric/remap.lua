vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set({"n", "v"}, "n", "gj")
vim.keymap.set({"n", "v"}, "e", "gk")
vim.keymap.set({"n", "v"}, "i", "l")
vim.keymap.set({"n", "v"}, "m", "i")

vim.keymap.set({"n"}, "l", "e")

-- -- windows movements
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-n>", "<C-w>n")
vim.keymap.set("n", "<A-e>", "<C-w>e")
vim.keymap.set("n", "<A-i>", "<C-w>i")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-o>", "<C-o>zz")
vim.keymap.set("n", "<C-i>", "<C-i>zz")
vim.keymap.set("n", "k", "nzzzv")
vim.keymap.set("n", "K", "Nzzzv")
vim.keymap.set("n", "<leader>k", ":noh<cr>")

vim.keymap.set("n", "<C-n>", "<C-e>")
vim.keymap.set("n", "<C-e>", "<C-y>")

-- selects the last pasted text in visual line mode
vim.keymap.set("n", "gp", "`[V`]")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>w", ":wa<cr>")

-- nvim-tree
vim.keymap.set("n", "<leader>f", ":Neotree reveal<cr>")

-- Set spelling keybinds
vim.keymap.set("n", "<leader>ssv", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=sv')
end)

vim.keymap.set("n", "<leader>sen", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=en')
end)

