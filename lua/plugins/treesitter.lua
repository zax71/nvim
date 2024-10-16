local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"rust",
				"svelte",
				"json",
				"toml",
				"yaml",
				"html",
				"css",
				"javascript",
				"latex",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

return { M }
