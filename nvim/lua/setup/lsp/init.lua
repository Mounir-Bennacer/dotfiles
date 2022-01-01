local status_ok = pcall(require, 'lspconfig')
if not status_ok then
    print('LSP not available')
end

require ("setup.lsp.installer")
