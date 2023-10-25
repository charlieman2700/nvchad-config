---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<Tab>"] = "",
    ["<C-i"] = "",
  },
  n = {
    ["<leader>wa"] = "",
    ["<leader>wk"] = "",
    ["<leader>wK"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
  },
}

M.general = {
  n = {
    -- Desactiva las asignaciones de teclas predeterminadas de tmux-navigator
    -- vim.g.tmux_navigator_no_mappings = 1

    -- Mapea las combinaciones de teclas a las funciones de TmuxNavigator
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<cr>", "Navigate right", opts = { nowait = true } },
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<cr>", "Navigate left", opts = { nowait = true } },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<cr>", "Navigate up", opts = { nowait = true } },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<cr>", "Navigate bottom", opts = { nowait = true } },
    -- Mapea las combinaciones de teclas a las funciones de TmuxResizer
    ["<C-u>l"] = { "<cmd> TmuxResizeRight<cr>", "Resize right", opts = { nowait = true } },
    ["<C-u>h"] = { "<cmd> TmuxResizeLeft<cr>", "Resize left", opts = { nowait = true } },
    ["<C-u>k"] = { "<cmd> TmuxResizeUp<cr>", "Resize up", opts = { nowait = true } },
    ["<C-u>j"] = { "<cmd> TmuxResizeDown<cr>", "Resize bottom", opts = { nowait = true } },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
    ["U"] = { "<C-r>", "REDO", opts = { nowait = true } },

    ["<leader>q"] = { "<cmd>q<cr>", "QUIT", opts = { nowait = true } },
    ["<leader>e"] = { "<CMD>NvimTreeToggle<CR>" },

    -- Movements
    --
    ["<C-d>"] = { "<C-d>zz", "Move down", opts = { nowait = true } },
    ["<C-u>"] = { "<C-u>zz", "Move up", opts = { nowait = true } },

    -- Hop
    ["s"] = { "<cmd> HopChar2 <cr>", "Hop", opts = { nowait = true } },
    --

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

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
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

    -- Buffers
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
  },

  v = {
    ["mm"] = { "%", "Jump", opts = { nowait = true } },
  },
}

-- more keybinds!
--

return M
