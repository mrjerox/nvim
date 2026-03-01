-- Fix tresitter not working
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		local builtin_languages = { "vim", "help", "lua", "bash" } -- System files
		local lang = vim.treesitter.language.get_lang(vim.bo.filetype)

		if lang then
			pcall(vim.treesitter.start)
		end
	end,
})
