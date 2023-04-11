vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        dianostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
        end,
        show_buffer_close_icons = false,
        close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
        offsets = {
            {
                filetype = 'neo-tree',
                text = 'Files',
                text_align = 'left',
                separator = true,
            }
        }
    }
}


