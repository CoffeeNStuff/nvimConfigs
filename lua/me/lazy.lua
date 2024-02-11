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
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function () 
			vim.cmd([[colorscheme kanagawa]])
		end,
	}, 
	{ 
		dir = "~/Projs/Noter", 
		lazy = false
	},  
	{ 
		"https://github.com/rxi/json.lua" 
	}, 
	require('me.plugins.telescope'), 
})

