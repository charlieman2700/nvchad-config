-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
--
--#r
vim.wo.wrap = false
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.tmux_navigator_no_mappings = 1



-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true

vim.g.number = true


-- Habilitar los números de línea en modo normal
vim.cmd('set number')

-- Habilitar los números de línea en modo insert
vim.cmd('autocmd InsertEnter * set norelativenumber')
vim.cmd('autocmd InsertLeave * set relativenumber')
