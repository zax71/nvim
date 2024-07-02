vim.g.mapleader = " "

vim.keymap.set("n", "<leader>dd", "<cmd> lua vim.diagnostic.open_float() <CR>")
