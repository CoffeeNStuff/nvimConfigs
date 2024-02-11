local opt = vim.opt

opt.number = true   -- use numbers 

opt.shiftwidth = 3 -- tab equals 3 spaces
opt.tabstop = 3 -- tab equals 3 spaces 

opt.textwidth = 85 
opt.autoindent = true

opt.linebreak = true -- so that lines don't wrap midword
opt.breakat = ' ' 

opt.clipboard:append("unnamedplus")   -- use system clipboard
opt.swapfile = false
