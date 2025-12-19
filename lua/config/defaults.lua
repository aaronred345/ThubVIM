vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Fold settings (treesitter folds are enabled per-filetype in auto-cmds.lua)
vim.opt.foldenable = false -- Don't fold by default
vim.opt.foldlevel = 99
vim.opt.viewoptions:remove("folds") -- Don't save fold settings in views
