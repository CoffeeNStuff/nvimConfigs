local keymap = vim.keymap

vim.g.mapleader = ';' 

keymap.set('n', '<leader>e', vim.cmd.Ex)
keymap.set('n', '<leader>s','<cmd> Telescope live_grep <cr>', {}) -- search in cwd
keymap.set('n', '<leader>c','<cmd> Telescope grep_string <cr>', {}) -- search cursor in cwd
keymap.set('n', '<leader>g','<cmd> Telescope git_files <cr>', {}) -- search all git files
vim.keymap.set('n', '<leader>n', ':lua noterOpen()<CR>', { silent = true }) -- Noter 
vim.keymap.set('n', '<leader>3', ':!git add --all ; git commit -m "$(date)" ; git push <cr>', { silent = true }) -- Noter 

vim.cmd([[cnoreabbrev qq q!]]) 
vim.cmd([[cnoreabbrev Wq wq]]) 
