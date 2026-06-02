return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	version = false, -- last release is way too old and doesn't work on Windows
	event = "VeryLazy",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts = {
		-- LazyVim config for treesitter
		ensure_installed = {
			"bash",
			"c",
			"css",
			"diff",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"printf",
			"python",
			"query",
			"regex",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"php",
			"scss",
		},
		-- indent = { enable = true },
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		local TS = require("nvim-treesitter.config")
		-- setup treesitter
		TS.setup(opts)
	end,
}
