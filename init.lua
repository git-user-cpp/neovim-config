vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.opt.number = true -- Make line numbers default (default: false)
vim.opt.relativenumber = true -- Set relative numbered lines (default: false)
vim.opt.wrap = true -- wrap lines
vim.opt.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120
vim.opt.mouse = 'a' -- Enable mouse mode (default: '')
vim.opt.autoindent = true -- Copy indent from current line when starting new one (default: true)
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.opt.smartcase = true -- Smart case (default: false)
vim.opt.smarttab = true
vim.opt.shiftwidth = 4 -- The number of spaces inserted for each indentation (default: 8)
vim.opt.tabstop = 4 -- Insert n spaces for a tab (default: 8)
vim.opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.opt.expandtab = true -- Convert tabs to spaces (default: false)
vim.opt.cursorline = true -- Highlight the current line (default: false)
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
vim.opt.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
vim.opt.smartindent = true -- Make indenting smarter again (default: false)
vim.opt.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')
vim.opt.breakindent = true -- Enable break indent (default: false)
