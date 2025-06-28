vim.opt.number = true -- Show line numbers
vim.opt.mouse = 'a' -- Enable mouse support
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
vim.signcolumn = 'yes' -- Always show sign column
vim.opt.splitright = true -- Split windows to the right
vim.opt.splitbelow = true -- Split windows below
vim.opt.inccommand = 'split' -- Show live substitutions
vim.opt.cursorline = true -- Highlight the current line
vim.opt.scrolloff = 10 -- Keep # lines above and below the cursor

-- TODO: Clipboard
-- Stolen from kickstart. See ':help clipboard' to edit
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Key mappings
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
