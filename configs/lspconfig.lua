local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

---@diagnostic disable-next-line: different-requires
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "svelte",
  "rust_analyzer",
  "tailwindcss",
  "prismals",
  "emmet_language_server",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "angularls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.phpactor.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    ["language_server_phpstan.enabled"] = false,
    ["language_server_psalm.enabled"] = false,
  },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      -- usePlaceholders = true,
      analyses = {
        unusedparams = true,
        unusedvariables = true,
        nilness = true,
        unusedwrite = true,
        shadow = true,
        useany = true,
      },
      staticcheck = true,
      experimentalPostfixCompletions = true,
      hints = {
        contantValues = true,
        functionTypeParameters = true,
        assignVariablesTypes = true,
        compositeLiteralTypes = true,
        compositeLiteralFields = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
