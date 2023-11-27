--
FormatOnSave = true
AutoSave = true

-- Load the project-specific configuration if it exists
local project_config = vim.fn.glob "./.config.lua"
if vim.fn.filereadable(project_config) then
  vim.cmd("source " .. project_config)
end

local autoSaveFileExtensions = {
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
  if FormatOnSave then
    --format the buffer saved on current_buffer
    vim.lsp.buf.format()
    -- Silent write
    vim.cmd "silent w"
  end
end

function AutoSave()
  if vim.o.modified == false then
    return
  end

  if AutoSave then
    if FormatOnSave then
      --format the buffer saved on current_buffer
      vim.lsp.buf.format()
      -- Silent write
      vim.cmd "silent w"
    end
  end
end

--
-- if AutoSave then
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = autoSaveFileExtensions,
  command = "lua AutoSave()",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "lua FormatOnSave()",
})
-- end
