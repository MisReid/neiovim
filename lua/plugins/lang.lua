-- Language plugins (lsp, treesitter, autocomplete, etc.)
return {
  -- Plugins here!
  {
    'github/copilot.vim',
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} }, -- Ensure mason is set up before lspconfig
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'hrsh7th/cmp-nvim-lsp',
    },
    config = require 'config.lsp',
  },
}
