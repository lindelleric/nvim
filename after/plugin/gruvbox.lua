-- local colors = require "gruvbox.palette"

-- taken from https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox/palette.lua
local c = {
  dark_brown = "#3b3307",
  dark_green = "#142a03",
  dark_red = "#431313",
  dark_yellow = "#4d520d",
  dark0_hard = "#1d2021",
  dark0 = "#282828",
  dark0_soft = "#32302f",
  dark1 = "#3c3836",
  dark2 = "#504945",
  dark3 = "#665c54",
  dark4 = "#7c6f64",
  light_brown = "#fdd69b",
  light_green = "#d5e958",
  light_red = "#ffb3a2",
  light_yellow = "#ffdb57",
  light0_hard = "#f9f5d7",
  light0 = "#fbf1c7",
  light0_soft = "#f2e5bc",
  light1 = "#ebdbb2",
  light2 = "#d5c4a1",
  light3 = "#bdae93",
  light4 = "#a89984",
  bright_red = "#fb4934",
  bright_green = "#b8bb26",
  bright_yellow = "#fabd2f",
  bright_blue = "#83a598",
  bright_purple = "#d3869b",
  bright_aqua = "#8ec07c",
  bright_orange = "#fe8019",
  neutral_red = "#cc241d",
  neutral_green = "#98971a",
  neutral_yellow = "#d79921",
  neutral_blue = "#458588",
  neutral_purple = "#b16286",
  neutral_aqua = "#689d6a",
  neutral_orange = "#d65d0e",
  faded_red = "#9d0006",
  faded_green = "#79740e",
  faded_yellow = "#b57614",
  faded_blue = "#076678",
  faded_purple = "#8f3f71",
  faded_aqua = "#427b58",
  faded_orange = "#af3a03",
  gray = "#928374",
}

require("gruvbox").setup {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  overrides = {
    -- SignColumn = { bg = colors.dark0_hard },
    -- DiffAdd = { bg = colors.dark0_hard, fg = colors.bright_green, reverse = false },
    -- DiffChange = { bg = colors.dark0_hard, fg = colors.bright_yellow, reverse = false },
    -- DiffRemoved = { bg = colors.dark0_hard, fg = colors.bright_red, reverse = true },
    -- -- DiffDelete = { bg = colors.dark0_hard, fg = colors.bright_red, reverse = true },
    -- CocCursorRange = { bg = colors.neutral_purple, fg = colors.light1 },
    -- -- CocErrorLine = { bg = colors.dark0_hard, fg = colors.bright_red },
    -- CocDiagnosticsError = { bg = colors.dark0_hard, fg = colors.bright_red },
    -- CocDiagnosticsHint = { bg = colors.dark0_hard, fg = colors.bright_red },
    -- CocDiagnosticsWarning = { bg = colors.dark0_hard, fg = colors.bright_orange },
    -- CocDiagnosticsInfo = { bg = colors.dark0_hard, fg = colors.bright_blue },
    -- -- ColorColumn = { bg = colors.dark0_hard },
    -- FgCocHintSignBgSignColumn = { bg = colors.dark1, fg = colors.bright_blue },
    -- Pmenu = { bg = colors.dark0_hard, fg = "white" },
    Comment = { italic = true }, -- popup menu colors
    -- Search = { bg = colors.neutral_purple, fg = colors.light1 }, -- search string highlight color

    -- uncomment?
    NonText = { fg = c.dark1 }, -- mask ~ on empty lines

    -- CursorLineNr = { bold = true }, -- make relativenumber bol
    SpellBad = { bold = true, undercurl = true }, -- misspelled words
  },
}

local M = {}


M.highlight = function(group, options)
    local guifg = options.fg or "NONE"
    local guibg = options.bg or "NONE"
    local guisp = options.sp or "NONE"
    local gui = options.gui or "NONE"
    local blend = options.blend or 0
    local ctermfg = options.ctermfg or "NONE"

    vim.cmd(
        string.format(
            "highlight %s guifg=%s ctermfg=%s guibg=%s guisp=%s gui=%s blend=%d",
            group,
            guifg,
            ctermfg,
            guibg,
            guisp,
            gui,
            blend
        )
    )
end

vim.cmd("colorscheme gruvbox")
-- Custom stuff for gruvbox
vim.cmd("hi @include guifg="..c.bright_red) -- Import statements
vim.cmd("hi @type guifg="..c.light0) -- Stuff with capital letters are treated as types, including importedimported  components
vim.cmd("hi @arrowfunction.arrow guifg="..c.bright_red) -- arrowfunction =>
vim.cmd("hi @function.call guifg="..c.bright_blue) -- Functions
vim.cmd("hi @method.call guifg="..c.bright_blue) -- Functions
vim.cmd("hi @method guifg="..c.bright_blue) -- Functions
vim.cmd("hi @tag guifg="..c.bright_aqua) -- tsx tags
vim.cmd("hi @tag.delimiter guifg="..c.bright_aqua) -- <> chars for tsx tags
vim.cmd("hi @constructor guifg="..c.bright_aqua) -- Some components are treated as constructors
vim.cmd("hi @operator guifg="..c.bright_purple) -- = && 
vim.cmd("hi @number guifg="..c.bright_yellow) -- number literals
vim.cmd("hi @property guifg="..c.light0_soft) -- ojb.property {property: 1}
vim.cmd("hi @punctuation.bracket guifg="..c.light0_soft) -- < > ()
vim.cmd("hi @punctuation.delimiter guifg="..c.light0_soft) -- .
vim.cmd("hi @array.bracket guifg="..c.bright_orange) -- [ ]
vim.cmd("hi @object.brace guifg="..c.bright_orange) -- [ ]
vim.cmd("hi @jsx.expression.brace guifg="..c.bright_orange) -- <jsx> {these breaces} </jsx>
vim.cmd("hi @jsx.prop.brace guifg="..c.bright_purple) -- <jsx> {these breaces} </jsx>
vim.cmd("hi @type.enclosingtags guifg="..c.bright_purple) -- <jsx> {these breaces} </jsx>
vim.cmd("hi @type.identifier guifg="..c.bright_yellow) -- <jsx> {these breaces} </jsx>

-- Stuff for neo-tree
vim.cmd("hi NeoTreeGitModified guibg=NONE guifg="..c.bright_blue)
vim.cmd("hi NeoTreeGitUntracked guibg=NONE guifg="..c.bright_green)
vim.cmd("hi NeoTreeDirectoryName guifg="..c.light2)
vim.cmd("hi NeoTreeDirectoryIcon guifg="..c.dark4)
vim.cmd("hi NeoTreeFileName guifg="..c.light2)

-- Stuff for gitsigns
vim.cmd("hi GitSignsAdd guibg=NONE guifg="..c.bright_green)
vim.cmd("hi GitSignsDelete guibg=NONE guifg="..c.bright_red)
vim.cmd("hi GitSignsChange guibg=NONE guifg="..c.bright_yellow)
vim.cmd("hi GitSignsUntracked guibg=NONE guifg="..c.bright_green)
vim.cmd("hi GitSignsCurrentLineBlame guibg=NONE guifg="..c.dark3)

-- Blankline
M.highlight("IblIndent", { fg = c.dark0, gui = "nocombine" })
M.highlight("IblWhitespace", { fg = c.dark0, gui = "nocombine" })
M.highlight("IblScope", { fg = c.dark2, gui = "nocombine" })
-- M.highlight("IndentBlanklineContextStart", { sp = c.dark0, gui = "underline" })
-- M.highlight("IndentBlanklineContextSpaceChar", { gui = "nocombine" })

vim.cmd("set cursorline")
vim.cmd("hi CursorLine guibg=#292929")
vim.cmd("hi CursorLineNr gui=bold guibg=#292929")

vim.cmd("set signcolumn=yes")
vim.cmd("hi SignColumn guibg=#1d2021")


-- Alactitty bg #1d2021
