-- Here is the formatting config
local null_ls = require("null-ls")
local sources = {
  -- null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.write_good,
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.formatting.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
}
require("null-ls").setup({
  sources = sources,
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end,
})
