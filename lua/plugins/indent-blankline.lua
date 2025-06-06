return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    local highlight = {
      "DraculaPurple",
    }
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "DraculaPurple", { fg = "#BD93F9" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    require("ibl").setup {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        highlight = highlight,
        show_start = false,
        show_end = false
      }
    }

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
