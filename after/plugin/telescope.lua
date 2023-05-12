local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function()
	builtin.find_files({
		find_command = {
			'rg',
			'--files',
			'-L', -- Allows rg to follow symlinks
		}
	})
end, {})

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function ()
	builtin.grep_string({ search = vim.fn.input ("Grep > ")})
end)

vim.keymap.set('n', '<leader>pg', function ()
	builtin.live_grep()
end)

vim.keymap.set('n', '<leader>cr', function ()
    builtin.lsp_references({
        show_line = false
    })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>ct', function ()
    builtin.lsp_type_definitions()
end)

vim.keymap.set('n', '<leader>cd', function ()
    builtin.lsp_definitions()
end)

vim.keymap.set('n', '<leader>ci', function ()
    builtin.lsp_implementations()
end)

