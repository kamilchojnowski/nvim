return {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    event = 'BufReadPre',
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}
