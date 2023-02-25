print("okay claling packer startup")

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly',
  }


  use {
    'akinsho/bufferline.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    tag = "v3.*",
  }

  use {
    'feline-nvim/feline.nvim'
  }

  use {
    'neovim/nvim-lspconfig'
  }


  use {
    "williamboman/mason.nvim"
  }

  -- autocompletion with cmp
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
      'neovim/nvim-lspconfig'
    }
  }
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- snippet engine
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'


  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    tag = '0.1.1',
  }


  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
  }


-- " telescope fuzzy finder
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }


  use {
    'nvim-treesitter/nvim-treesitter',
    -- {'do': ':TSUpdate'}
  }

  use {
    "folke/which-key.nvim",
  }

  -- colorschemes
  use {
    "catppuccin/nvim",
    as = "catppuccin"
  }

end)
