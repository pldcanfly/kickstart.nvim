
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})
-- Format current buffer using LSP.
vim.api.nvim_create_autocmd({ "BufWritePre" },
  {
    pattern = { "*.templ" },
    callback = function()
      -- Format the current buffer using Neovim's built-in LSP (Language Server Protocol).
      vim.lsp.buf.format()
    end,
  }
)
vim.filetype.add({
  extension = {
    templ = "templ",
  },
})
