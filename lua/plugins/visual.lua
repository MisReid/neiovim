-- Visual plugins
return {
  -- Plugins here!
  {
    'neanias/everforest-nvim',
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('everforest').setup {
        background = 'soft',
      }
      vim.cmd.colorscheme 'everforest'
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opt = {
      signs = {
        add = { text = '|' },
        change = { text = '|' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'everforest',
        },
      }
    end,
  },
}
