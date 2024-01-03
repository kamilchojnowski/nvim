local config = function()
    require('nvim-treesitter.configs').setup({
        indent = {
            enable = true,
        },
        autotag = {
            enable = false,
        },
        ensure_installed = {
            -- required
            'c', 'lua', 'vim', 'vimdoc', 'query',
            'markdown', 'json', 'yaml', 'html', 'javascript', 'python', 'bash', 'gitignore'
        },
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighing = true
        },
        ignore_install = {},
        sync_install = false,
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<A-space>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
        },
    })
end

return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = config,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
}
