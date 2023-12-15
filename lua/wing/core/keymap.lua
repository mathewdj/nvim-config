vim.g.mapleader = " "

local keymap = vim.keymap
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })

keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>tf", "<cmd>NvimTreeFocus<CR>", { desc = "Toggle file focus" }) -- toggle file explorer on current file
