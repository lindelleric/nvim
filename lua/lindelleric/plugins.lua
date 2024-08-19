
-- local copilotConf = require('./../../after/plugin/copilot.lua')
--


-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "norcalli/nvim-colorizer.lua"

  use { "ellisonleao/gruvbox.nvim" }

  use "rebelot/kanagawa.nvim"

  use("nvim-treesitter/nvim-treesitter" , {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-context')
  use('windwp/nvim-ts-autotag')
  use('JoosepAlviste/nvim-ts-context-commentstring')

  use('theprimeagen/harpoon')

  use('mbbill/undotree')

  use('lewis6991/gitsigns.nvim')
  use "lukas-reineke/indent-blankline.nvim"

  use('luckasRanarison/tailwind-tools.nvim',{
      dependencies = {
          'nvim-treesitter/nvim-treesitter',
      }
  })

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'tpope/vim-surround'

  -- use 'axkirillov/hbac.nvim'
  use 'famiu/bufdelete.nvim'

  use({
    "stevearc/oil.nvim"
  })

  -- use {
  --     "zbirenbaum/copilot.lua",
  --     cmd = "Copilot",
  --     event = "InsertEnter",
  --     config = function()
  --         require("copilot").setup({})
  --     end,
  --
  --     -- config = function()
  --     --     require("copilot").setup({
  --     --         -- panel = {
  --     --         --     enabled = true,
  --     --         --     auto_refresh = false,
  --     --         --     keymap = {
  --     --         --         jump_prev = "[[",
  --     --         --         jump_next = "]]",
  --     --         --         accept = "<CR>",
  --     --         --         refresh = "gr",
  --     --         --         open = "<M-CR>"
  --     --         --     },
  --     --         --     layout = {
  --     --         --         position = "bottom", -- | top | left | right
  --     --         --         ratio = 0.4
  --     --         --     },
  --     --         -- },
  --     --         -- suggestion = {
  --     --         --     enabled = true,
  --     --         --     auto_trigger = false,
  --     --         --     debounce = 75,
  --     --         --     keymap = {
  --     --         --         accept = "<M-l>",
  --     --         --         accept_word = false,
  --     --         --         accept_line = false,
  --     --         --         next = "<M-]>",
  --     --         --         prev = "<M-[>",
  --     --         --         dismiss = "<C-]>",
  --     --         --     },
  --     --         -- },
  --     --         -- filetypes = {
  --     --         --     yaml = false,
  --     --         --     markdown = false,
  --     --         --     help = false,
  --     --         --     gitcommit = false,
  --     --         --     gitrebase = false,
  --     --         --     hgcommit = false,
  --     --         --     svn = false,
  --     --         --     cvs = false,
  --     --         --     ["."] = false,
  --     --         -- },
  --     --         -- copilot_node_command = 'node', -- Node.js version must be > 18.x
  --     --         -- server_opts_overrides = {},
  --     --     })
  --     -- end,
  -- }
  use'github/copilot.vim'

  use('CopilotC-Nvim/CopilotChat.nvim', {
      branch = 'canary',
      dependencies = {
          'nvim-lua/plenary.nvim',
          'zbirenbaum/copilot.lua'
      }
  })

  -- Give me that tree!
  -- use("nvim-tree/nvim-web-devicons")
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    
  -- use {
  --   'akinsho/bufferline.nvim',
  --   tag = "v3.*",
  --   requires = 'nvim-tree/nvim-web-devicons'
  -- }

  use {
    "nvim-neorg/neorg",
    ft = "norg",
    -- run = ":Neorg sync-parsers", -- This is the important bit!
    requires = "nvim-lua/plenary.nvim",
}

  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons"
  }







  use('neovim/nvim-lspconfig')
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use('b0o/schemastore.nvim')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)





