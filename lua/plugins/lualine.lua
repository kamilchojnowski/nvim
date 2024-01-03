local config = function()
    local theme = require('lualine.themes.catppuccin-macchiato')

    require('lualine').setup {
        options = {
            theme = theme,
            globalstatus = true,
            component_separators = '|',
            section_separators = '',
            icons_enabled = false,
        },
    }
end

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = config,
}
