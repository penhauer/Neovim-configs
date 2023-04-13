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
    "williamboman/mason.nvim",
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
      'neovim/nvim-lspconfig'
    }
  }

  -- autocompletion with cmp
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {
      'neovim/nvim-lspconfig'
    }
  }

  use {
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
  }

  use {
    'onsails/lspkind.nvim'
  }

  -- snippet engine
  use {
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
  }


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


  use {
    'numToStr/Comment.nvim',
  }

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


  -- noice
  use({
    "folke/noice.nvim",
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  })

end)
