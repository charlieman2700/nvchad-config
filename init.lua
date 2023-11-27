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
vim.cmd "set number"
vim.cmd "set wrap"
vim.cmd "set autoread"

-- Habilitar los números de línea en modo insert
vim.cmd "autocmd InsertEnter * set norelativenumber"
vim.cmd "autocmd InsertLeave * set relativenumber"

FormatOnSave = true
AutoSave = true

-- Load the project-specific configuration if it exists
local project_config = vim.fn.glob "./.config.lua"
if vim.fn.filereadable(project_config) then
  vim.cmd("source " .. project_config)
end

-- local saveFileTypes = {
--   "lua",
--   "*.js",
--   "*.jsx",
--   "*.ts",
--   "*.tsx",
--   "*.go",
--   "*.rs",
--   "*.py",
--   "*.lua",
--   "*.sh",
--   "*.html",
--   "*.css",
--   "*.json",
--   "*.yaml",
--   "*.markdown",
--   "*.vim",
--   "*.conf",
--   "*.dockerfile",
--   "*.graphql",
--   "*.php",
--   "*.java",
--   "*.ruby",
--   "*.elixir",
--   "*.erlang",
--   "*.haskell",
--   "*.scala",
-- }
--
local saveFileTypes = {
  "*.lua",
  "*.js",
  "*.jsx",
  "*.ts",
  "*.tsx",
  "*.go",
  "*.rs",
  "*.py",
  "*.lua",
  "*.sh",
  "*.html",
  "*.css",
  "*.json",
  "*.yaml",
  "*.markdown",
  "*.vim",
  "*.conf",
  "*.dockerfile",
  "*.graphql",
  "*.php",
  "*.java",
  "*.ruby",
  "*.elixir",
  "*.erlang",
  "*.haskell",
  "*.scala",
}

function FormatOnSave()
  local file_extension = vim.fn.expand "%:e"
  file_extension = "*." .. file_extension
  print("File extension: " .. file_extension)
  if vim.o.modified == false then
    print "FormatOnSave: file not modified"
    return
  end

  if vim.fn.index(saveFileTypes, file_extension) < 0 then
    print "FormatOnSave: filetype not supported"
    return
  end

  if FormatOnSave then
    print "FormatOnSave: formatting"
    vim.lsp.buf.format()
  end

  print "FormatOnSave: saving"

  vim.cmd "w"
end

--
-- -- SAVING AND FORMATTING
vim.api.nvim_set_keymap("n", "<leader>w", "", { noremap = true, silent = true, callback = FormatOnSave })

--
-- if AutoSave then
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = saveFileTypes,
  -- filetypes = saveFileTypes,

  -- enable wrap mode for json files only
  command = "lua FormatOnSave()",
})
-- end
