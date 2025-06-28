-- Utility plugins (autopairs, etc.)
return {
  -- Plugins here!
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {}
    end,
  },
  {
    'trope/vim-sleuth',
  },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.pairs').setup()
      require('mini.surround').setup()
    end,
  },
}
