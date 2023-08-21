---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
    ["<leader>q"] = { "<cmd>q<cr>", "QUIT", opts = { nowait = true } },
    ["<leader>w"] = { ":w<CR>", "Save", opts = { nowait = true } },
    ["<leader>e"] = { "<CMD>NvimTreeToggle<CR>" },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
  v = {
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
