local M = {}

M.setup = function(_, install_directory)
	local mason_registry = require("mason-registry")
	local dap = require("dap")

	if not mason_registry.is_installed("bash-debug-adapter") then
		return
	end

	local mason_directory = vim.fn.stdpath("data") .. "/mason/"
	local mason_bin_directory = mason_directory .. "bin/"
	local bashdb_directory = mason_directory .. "packages/bash-debug-adapter/extension/bashdb_dir"

	dap.adapters.sh = {
		type = "executable",
		command = mason_bin_directory .. "bash-debug-adapter",
		args = { "--interpreter=vscode" },
	}

	dap.configurations.sh = {
		{
			name = "Launch Bash Debugger",
			type = "sh",
			request = "launch",
			program = "${file}",
			cwd = "${fileDirname}",
			pathBashdb = bashdb_directory .. "/bashdb",
			pathBashdbLib = bashdb_directory,
			pathBash = "bash",
			pathCat = "cat",
			pathMkfifo = "mkfifo",
			pathPkill = "pkill",
			env = {},
			args = {},
			-- showDebugOutput = true,
			-- trace = true,
		},
	}
end

return M
