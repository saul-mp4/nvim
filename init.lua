vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)

vim.cmd.colorscheme("catppuccin")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript", "html" },
	sync_install = false,
	highlight = { enable = true },
	indent = { enable = true },
})
