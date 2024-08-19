local lsp = require("lsp-zero")
local root_pattern = require('lspconfig.util').root_pattern


require('mason').setup({})
require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
      'tsserver',
      'eslint',
      'lua_ls',
      'rust_analyzer',
      'pyright',
      'csharp_ls',
      'bashls',
      'clangd',
      'dockerls',
      'docker_compose_language_service',
      'jsonls',
      'marksman',
      'yamlls',
      'gopls'
    },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
})


-- require('lspconfig').harper_ls.setup{}

lsp.preset("recommended")



-- lsp.ensure_installed({
--   'tsserver',
--   'eslint',
--   'lua_ls',
--   'rust_analyzer',
--   'pyright',
--   'csharp_ls',
--   'bashls',
--   'clangd',
--   'dockerls',
--   'docker_compose_language_service',
--   'jsonls',
--   'marksman',
--   'yamlls',
--   'gopls'
-- })
--
-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.configure('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
-- require('lspconfig').jsonls.setup {
--   settings = {
--     json = {
--       schemas = require('schemastore').json.schemas(),
--       validate = { enable = true },
--     },
--   },
-- }

lsp.configure('tsserver', { root_dir = root_pattern('.git'), detached = false })
lsp.configure('csharp_ls', { root_dir = root_pattern('.git'), detached = false })
lsp.configure('bashls', {
        filetypes = {'bash', 'sh', 'zsh'}
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })

  cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })

-- https://github.com/windwp/nvim-autopairs#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)


-- -- disable completion with tab
-- -- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

-- This snippet is from prime, it makes tsserver detach all the fricking time
--  if client.name == "eslint" then
--      vim.cmd.LspStop('eslint')
--      return
--  end

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  -- References are setup in telescope 
  -- vim.keymap.set("n", "cd", vim.lsp.buf.definition, opts)
  -- vim.keymap.set("n", "gi", vim.lsp.buf.go_to_implementation, opts)
  -- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)


lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
