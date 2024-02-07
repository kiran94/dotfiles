-- Prints the Object
-- https://github.com/nanotee/nvim-lua-guide#tips-3
function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end

-- Neovim Python

function _G.ensure_neovim_venv_exists()
	local virtualenv_dir = vim.env.HOME .. "/.virtualenvs"
	local venv_name = "neovim"
	local venv_dir = virtualenv_dir .. "/" .. venv_name

	-- Check if the directory and virtual environment already exist
	local dir_exists = vim.fn.isdirectory(virtualenv_dir) == 1
	local venv_exists = vim.fn.isdirectory(venv_dir) == 1

	-- Create the directory if it doesn't exist
	if not dir_exists then
		vim.notify("creating directory: " .. virtualenv_dir)
		vim.fn.system("mkdir -p " .. virtualenv_dir)
	end

	-- Create the virtual environment if it doesn't exist
	if not venv_exists then
		local venv_cmd = "python -m venv " .. venv_dir

		vim.notify("creating virtual environment: " .. venv_cmd)
		vim.fn.system(venv_cmd)
	end

	return venv_dir
end

vim.fn.install_neovim_python_package = function(packages)
	local venv_dir = _G.ensure_neovim_venv_exists()

    local package_list = _G.join_strings(packages, " ")
	local install_cmd = venv_dir .. "/bin/python -m pip install " .. package_list

    vim.notify("installing packages: " .. install_cmd)
    vim.fn.system(install_cmd)
end

-- Function to join strings in a list with a specified delimiter
function _G.join_strings(list, delimiter)
    local result = ""
    for i, str in ipairs(list) do
        result = result .. str
        if i < #list then
            result = result .. delimiter
        end
    end
    return result
end

