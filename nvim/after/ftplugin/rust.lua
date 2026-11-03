local opts = { buffer = true, silent = true }

vim.keymap.set("n", "<leader>ra", function()
	vim.cmd.RustLsp("codeAction")
end, vim.tbl_extend("force", opts, { desc = "Rust code action" }))

vim.keymap.set("n", "<leader>rr", function()
	vim.cmd.RustLsp("runnables")
end, vim.tbl_extend("force", opts, { desc = "Rust run target" }))

vim.keymap.set("n", "<leader>rt", function()
	vim.cmd.RustLsp("testables")
end, vim.tbl_extend("force", opts, { desc = "Rust test target" }))

vim.keymap.set("n", "<leader>rd", function()
	vim.cmd.RustLsp("debuggables")
end, vim.tbl_extend("force", opts, { desc = "Rust debug target" }))
