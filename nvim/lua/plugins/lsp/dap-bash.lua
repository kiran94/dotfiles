local M = {}

M.setup = function(dap, install_directory)
    local mason_registry = require("mason-registry")

	if mason_registry.is_installed("bash-debug-adapter") then
		dap.adapters.sh = {
			type = "executable",
			command = install_directory .. "bash-debug-adapter",
			args = { "--interpreter=vscode" },
		}

		dap.configurations.sh = {
			{
				args = {},
				argsString = "",
				cwd = vim.fn.getcwd(),
				env = {},
				name = "Launch",
				pathBash = "/usr/bin/bash",
				-- bash-debug-adapter
				-- https://sourceforge.net/projects/bashdb/
                -- TODO: Get this installed and make OS dynamic
				-- pathBashdb = "/opt/homebrew/bin/bashdb",
				-- pathBashdbLib = "/opt/homebrew/share/bashdb/",
				pathCat = "/bin/cat",
				pathMkfifo = "/usr/bin/mkfifo",
				pathPkill = "/usr/bin/pkill",
				program = "${file}",
				request = "launch",
				showDebugOutput = false,
				terminalKind = "integrated",
				trace = true,
				type = "sh",
			},
		}
	end
end

return M
