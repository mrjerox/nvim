return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" }
  },
  opts = {
    defaults = {
      -- Default configuration for telescope goes here:
      -- config_key = value,
      file_ignore_patterns = {
        "node_modules",
        ".git",
        ".vscode",
      },
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {}
      }
    }
  },
  config = function(_, opts)
    require("telescope").setup(opts)

    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

    -- Load the telescope-ui-select extension
    telescope.load_extension("ui-select")
    telescope.load_extension("noice")
  end,
}
