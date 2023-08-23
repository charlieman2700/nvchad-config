---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
    ["U"] = { "<C-r>", "REDO", opts = { nowait = true } },

    ["<leader>q"] = { "<cmd>q<cr>", "QUIT", opts = { nowait = true } },
    ["<leader>w"] = { ":w<CR>", "Save", opts = { nowait = true } },
    ["<leader>e"] = { "<CMD>NvimTreeToggle<CR>" },

    -- LSP
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>lk"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["<leader>lj"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },
  },
  v = {
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
