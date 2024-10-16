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
				"tsserver", -- Typescript
				"html", -- HTML
				"cssls", -- CSS
				"tailwindcss", -- CSS
				"svelte", -- Svelte
				"lua_ls", -- Lua
				"emmet_ls", -- HTML esque
				"pyright", -- Python
				"rust_analyzer", -- Rust
				"gopls", -- Go
				"texlab", -- LaTeX
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- JS formatter
				"stylua", -- Lua formatter
				"isort", -- Python formatter
				"black", -- Python formatter
				"gofumpt", -- Go formatter
				"taplo", -- TOML Formatter

				"pylint", -- Python linter
				"eslint_d", -- JS linter
				"luacheck", -- Lua linter
				"golangci-lint", -- Go linter
			},
			auto_update = true,
		})
	end,
}
