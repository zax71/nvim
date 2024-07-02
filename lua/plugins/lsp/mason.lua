return {
    "williamboman/mason-lspconfig.nvim",
	dependencies = {
        "williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- load mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- Load mason tool installer
		local mason_tool_installer = require("mason-tool-installer")

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
				"svelte", -- .svelte
				"lua_ls", -- .lua
				"emmet_ls", -- HTML esque
				"pyright", -- .py
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- js
				"stylua", -- lua
				"isort", -- python
				"black", -- python
			},
			auto_update = true,
		})
	end,
}
