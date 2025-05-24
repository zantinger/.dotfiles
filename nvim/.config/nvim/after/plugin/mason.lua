require('mason').setup()
require('mason-lspconfig').setup({
    -- Configure LSP for Rust
    ensure_installed = { 'rust_analyzer' }
})
