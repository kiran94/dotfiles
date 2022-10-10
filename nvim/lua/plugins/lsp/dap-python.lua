local M = {}

M.setup = function(dap, install_directory)

	local dap_python_ok, dap_python = pcall(require, "dap-python")
	if dap_python_ok then
		-- WARN: this is not working
		local p = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python3"
		dap_python.setup(p)
		dap_python.test_runner = "pytest"
	else
		dap.adapters.python = { type = "executable", command = install_directory .. "debugpy-adapter" }
	end

end

return M
