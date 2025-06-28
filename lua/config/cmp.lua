-- TODO: luasnip setup
return function()
  local cmp = require("cmp")
  local luasnip = require 'luasnip'
  luasnip.config.setup {}

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = { completeopt = 'menu,neuone,noinsert' },
    mapping = cmp.mapping.preset.insert({
      ["<C-Down>"] = cmp.mapping.select_next_item(),
      ["<C-Up>"] = cmp.mapping.select_prev_item(),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
      { name = "lazydev", group_index = 0,},
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
    },
  })
end
