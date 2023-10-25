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
vim.g.tmux_resizer_no_mappings = 1



 vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and        --
-- Set tab width to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true

vim.g.number = true


-- Habilitar los números de línea en modo normal
vim.cmd('set number')
vim.cmd('set wrap')
vim.cmd('set autoread')

-- Habilitar los números de línea en modo insert
vim.cmd('autocmd InsertEnter * set norelativenumber')
vim.cmd('autocmd InsertLeave * set relativenumber')

-- Load the project-specific configuration if it exists
local project_config = vim.fn.glob('./pinit.lua')
if vim.fn.filereadable(project_config) then
    vim.cmd('source ' .. project_config)
end


-- Verifica si ya existe un mapeo para <leader>w
local existing_mapping = vim.fn.maparg("<leader>w", "n")

if not existing_mapping or existing_mapping == "" then
    -- Si no existe un mapeo previo, establece el nuevo mapeo
    vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
end

