local ok, dap = pcall(require, "dap-go")

if ok then
	vim.api.nvim_set_keymap(
		"n",
		"<leader>dt",
		"<cmd>lua require('dap-go').debug_test() <CR>",
		{ noremap = true, silent = true }
	)
end
