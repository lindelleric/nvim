-- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to s
-- peed up loading instead.
require('ts_context_commentstring').setup()
require('Comment').setup {
  -- pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  -- pre_hook = require('ts_context_commentstring').setup(),
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

}

vim.g.skip_ts_context_commentstring_module = true


