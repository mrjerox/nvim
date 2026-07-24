-- Fix tresitter not working
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)

		if lang then
			pcall(vim.treesitter.start)
		end
	end,
})

-- Auto reload files on focus gain (handles tmux)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	callback = function()
		vim.cmd("checktime")
	end,
})

-- Clear all semantic highlight groups after LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
			pcall(vim.api.nvim_set_hl, 0, group, {})
		end
	end,
})

-- Add $ to keyword
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scss", "sass" },
	callback = function()
		-- Thêm $ vào danh sách ký tự của từ (keyword)
		vim.opt_local.iskeyword:append("$")
	end,
})
