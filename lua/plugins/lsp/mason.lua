return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")
        
        -- load mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig") 
        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "typos_lsp", -- Generic spell check
                "neocmake", -- Makefile
                "tsserver", -- .ts
                "html", -- .html
                "cssls", -- .css
                "tailwindcss", -- .css
                "svelte",
                "lua_ls",
                "emmet_ls",
                "pyright",
            },
        })
    end,
}
