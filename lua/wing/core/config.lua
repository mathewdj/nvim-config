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

-- Share clipboard
opt.clipboard:append("unnamed")

-- Allow - to be part of a word
opt.iskeyword:append("-")

-- Allow mouse
--#opt.mouse="a"
