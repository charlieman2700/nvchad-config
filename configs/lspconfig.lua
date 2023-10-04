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
  "gopls",
  "prismals",
  "emmet_language_server",
  "docker_compose_language_service",
  "dockerls",
  "eslint",
  "angularls"
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

-- local project_library_path = "/path/to/project/lib"
-- local cmd =
--   { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }
--
-- lspconfig.angularls.setup {
--   cmd = cmd,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.cmd = cmd
--   end,
-- }

-- require'lspconfig'.angularls.setup{}

-- - `cmd` : { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }
-- - `filetypes` : { "typescript", "html", "typescriptreact", "typescript.tsx" }
-- - `root_dir` : root_pattern("angular.json")
-- local cwd = vim.fn.getcwd()
-- local cmd = {
--   "node",
--   "/Users/charlieman2700/dev/ucr/ride/ride-biker/node_modules/@angular/language-service/bundles/language-service.js",
--   "--stdio",
--   "--tsProbeLocations",
--   cwd,
--   "--ngProbeLocations",
--   cwd,
-- }
--
--
-- lspconfig.angularls.setup {
--   cmd = cmd,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.cmd = cmd
--   end,
-- }
