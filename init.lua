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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    "https://github.com/vim-airline/vim-airline",
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.4",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {{
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "html", "python", "kotlin", "java", "typescript", "terraform" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },  
            })
        end
    }},
    {
	"neovim/nvim-lspconfig"
    }
})

vim.cmd [[colorscheme nightfly]]

require('language_server_config')
require('nvim_tree_config')

local keymap = vim.keymap
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
