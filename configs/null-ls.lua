local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "svelte", "typescriptreact", "javascriptreact" ,"typescript"} }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Rust
  b.formatting.rustfmt,

  -- PHP
  b.formatting.pint,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
