local null_ls = require "null-ls"

local b = null_ls.builtins

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier,
  b.formatting.eslint_d, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with {
  --   filetypes = {
  --     "html",
  --     "markdown",
  --     "css",
  --     "svelte",
  --     "typescriptreact",
  --     "javascriptreact",
  --     "typescript",
  --     "javascript",
  --     "json",
  --     "yaml",
  --     "vue",
  --   },
  -- }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Rust
  b.formatting.rustfmt,

  -- PHP
  b.formatting.pint,

  b.formatting.gofumpt,
  b.formatting.goimports_reviser,
  b.formatting.golines,
  -- b.diagnostics.cpplint.with { extra_args = { "—filter", "-legal/copyright" } },
  b.diagnostics.cppcheck,

  b.diagnostics.eslint_d,
  b.code_actions.eslint_d,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" and client.name == "gofumpt" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
