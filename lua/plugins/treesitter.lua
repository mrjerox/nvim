return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = false, -- last release is way too old and doesn't work on Windows
	-- event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	event = "VeryLazy",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts = {
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
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
	config = function(_, opts)
		local TS = require("nvim-treesitter.config")
		TS.setup(opts)
	end,
}
