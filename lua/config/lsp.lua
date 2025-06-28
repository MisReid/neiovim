-- Ripped from kickstart.nvim
-- TODO: Recreate myself
return function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      local bufnr = args.buf

      -- LSP keymaps
     vim.keymap.set("n", "gd", vim.lsp.buf.lsp_definitions, { buffer = event.buf, desc = "[g]oto [d]efinition" }) 
     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "[g]oto [D]eclaration" })
     vim.keymap.set("n", "gi", vim.lsp.buf.lsp_implementations, { buffer = event.buf, desc = "[g]oto [i]mplementations" })
     vim.keymap.set("n", "gt", vim.lsp.buf.lsp_type_definitions, { buffer = event.buf, desc = "[g]oto [t]ype definition" })
     vim.keymap.set("n", "cN", vim.lsp.buf.rename, { buffer = event.buf, desc = "[c]hange [N]ame" }) 
     vim.keymap.set("n", "<leader>ca", vim.lsp.code_action, { buffer = event.buf, desc = "[c]ode [a]ction" })

      -- LSP autocommands
    end
  })

  vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
    callback = function(args)
      -- Clear any autocommands or keymaps related to the LSP client
      vim.lsp.buf.clear_references()
    end
  })

  -- Stolen from kickstart.nvim
  --  By default, Neovim doesn't support everything that is in the LSP specification.
  --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
  --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

  require("mason-lspconfig").setup {
    ensure_installed = {
      "bashls",
      "lua_ls",
      "pyright",
      "rust_analyzer",
      "clangd",
      "cmake",
      "yamlls",
    },
  }
end
