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

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  { 
    "bluz71/vim-nightfly-colors", 
    name = "nightfly", 
    lazy = false, 
    priority = 1000, 
    config = function()
        vim.cmd [[colorscheme nightfly]]
    end},
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

