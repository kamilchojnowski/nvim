local config = function()
    local telescope = require('telescope')
    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ['<C-k>'] = 'move_selection_previous',
                    ['<C-j>'] = 'move_selection_next',
                },
            },
        },
        pickers = {
            ['find_files'] = { wrap_results = true },
            ['diagnostics'] = { wrap_results = true },
        }
    })
end


return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = config,
    keys = {
        { '<leader>sg', '<cmd>Telescope live_grep<cr>',   desc = '[S]earch by [G]rep' },
        { '<leader>sf', '<cmd>Telescope find_files<cr>',  desc = '[S]earch [F]iles' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
        { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch [W]ord' },
        { '<leader>sb', '<cmd>Telescope buffers<cr>',     desc = '[S]earch [B]uffers' },
        { '<leader>gs', '<cmd>Telescope git_status<cr>',  desc = '[G]it [S]tatus' },
        {
            '<leader>?',
            function()
                require('telescope.builtin').oldfiles {
                    prompt_title = 'Recent files',
                }
            end,
            desc = '[S]earch [F]iles'
        },
    },
}
