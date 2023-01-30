local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.ensure_installed({
    'gopls',
    'gofumpt',
    'goimports',
    'gotests',
    'marksman',
    'json-lsp',
    'arduino-language-server',
    'clangd',
    'bash-language-server',
    'lua-language-server',
})

vim.diagnostic.config({
    virtual_text = false
})
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.lsp.set_log_level("debug")
