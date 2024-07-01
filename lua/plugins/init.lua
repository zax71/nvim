return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy=true,
        config = function()
            require("catppuccin").setup({
                transparent_background = true 
            })
        end
    },
    { 
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    }
}
