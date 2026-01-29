---@type vim.lsp.Config
return {
    cmd = { 'rust_analyzer' },
    filetypes = { 'rs' },
    root_markers = {
        'Cargo.toml',
        '.git',
    },
}
