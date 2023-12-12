local opt = vim.opt 
opt.relativenumber = true

opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

-- Search
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
--opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Allow - to be part of a word
opt.iskeyword:append("-")

require('wing.lazy')

vim.cmd [[colorscheme nightfly]]

require('language_server_config')
require('nvim_tree_config')

local keymap = vim.keymap
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
