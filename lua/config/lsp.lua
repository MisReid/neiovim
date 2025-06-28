-- Ripped from kickstart.nvim
-- TODO: Recreate myself
return function()
  vim.api.nvim_create_augroup("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(args)
      local client_id = args.data.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      local bufnr = args.buf

      -- LSP keymaps
     vim.keymap.set("n", "gd", vim.lsp.buf.lsp_definitions, { buffer = bufnr("%"), desc = "[g]oto [d]efinition" }) 
     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr("%"), desc = "[g]oto [D]eclaration" })
     vim.keymap.set("n", "gi", vim.lsp.buf.lsp_implementations, { buffer = bufnr("%"), desc = "[g]oto [i]mplementations" })
     vim.keymap.set("n", "gt", vim.lsp.buf.lsp_type_definitions, { buffer = bufnr("%"), desc = "[g]oto [t]ype definition" })
     vim.keymap.set("n", "cN", vim.lsp.buf.rename, { buffer = bufnr("%"), desc = "[c]hange [N]ame" }) 
     vim.keymap.set("n", "<leader>ca", vim.lsp.code_action, { buffer = bufnr("%"), desc = "[c]ode [a]ction" })

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
