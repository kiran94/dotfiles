local M = {}

local function list_files_recursively(path, output, excluded_extensions)
	output = output or {}
	excluded_extensions = excluded_extensions or {}
	local files = vim.fn.globpath(path, "*", true, true)

	for _, file in ipairs(files) do
		local stat = vim.loop.fs_stat(file)
		if stat then
			if stat.type == "directory" then
				list_files_recursively(file, output, excluded_extensions)
			else
				local ext = string.match(file, "%.([^%./]+)$")

				if ext == nil then
					vim.notify("No extension found", vim.log.levels.DEBUG)
				elseif table.contains(excluded_extensions, ext) then
					vim.notify(file .. " excluded", vim.log.levels.DEBUG)
				else
					table.insert(output, file)
				end
			end
		end
	end

	return output
end

M.setup = function()
	local dap = require("dap")
	local reg = require("mason-registry")

	if not reg.is_installed("netcoredbg") then
		vim.notify("netcoredbg not found")
		return
	end

	local netcoredbg = reg.get_package("netcoredbg")

	local adapter_config = {
		type = "executable",
		command = netcoredbg:get_install_path() .. "/netcoredbg",
		args = { "--interpreter=vscode" },
	}

	-- neotest-dotnet needs 'netcoredbg'
	dap.adapters.netcoredbg = adapter_config
	dap.adapters.coreclr = adapter_config

	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch",
			request = "launch",
			program = function()
				local output = {}
				list_files_recursively(vim.fn.getcwd() .. "/bin/Debug/", output, { ".json", ".pdb" })

				local to_debug_index = vim.fn.inputlist(output)
				local to_debug = output[to_debug_index]

				vim.notify("Debugging:" .. to_debug, vim.log.levels.DEBUG)

				return to_debug
			end,
		},
	}
end

return M
