vim.g.mapleader = " "


vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


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
vim.keymap.set("n", "<leader>f", ":Neotree filesystem reveal left<cr>")

-- Set spelling keybinds
vim.keymap.set("n", "<leader>sv", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=sv')
end)

vim.keymap.set("n", "<leader>en", function()
	vim.cmd(':set spell')
	vim.cmd(':setlocal spell spelllang=en')
end)

