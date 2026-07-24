return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
			vim.keymap.set("n", "<C-b>", function()
				vim.cmd("NvimTreeToggle")
			end, { desc = "Telescope find files", noremap = true })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
					".vscode",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
}
