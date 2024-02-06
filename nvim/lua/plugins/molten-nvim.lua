return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	dependencies = {
		"3rd/image.nvim",
		"GCBallesteros/jupytext.nvim",
	},
	event = "BufEnter *.ipynb",
	build = function()
		-- Makes
		vim.cmd("UpdateRemotePlugins")

		local virtualenv_dir = vim.env.HOME .. "/.virtualenvs"
		local venv_name = "neovim"
		local venv_dir = virtualenv_dir .. "/" .. venv_name

		-- Check if the directory and virtual environment already exist
		local dir_exists = vim.fn.isdirectory(virtualenv_dir) == 1
		local venv_exists = vim.fn.isdirectory(venv_dir) == 1

		-- Create the directory if it doesn't exist
		if not dir_exists then
			vim.fn.system("mkdir -p " .. virtualenv_dir)
		end

		-- Create the virtual environment if it doesn't exist
		if not venv_exists then
			local venv_cmd = "python -m venv " .. venv_dir
			vim.fn.system(venv_cmd)
		end

		-- Install Molten Dependencies
		if venv_exists then
			local install_cmd =
				"~/.virtualenvs/neovim/bin/python -m pip install pynvim jupyter_client cairosvg plotly kaleido pnglatex pyperclip ipykernel jupytext"

			vim.fn.system(install_cmd)
		end
	end,
	init = function()
		vim.g.molten_wrap_output = true
		vim.g.molten_virt_text_output = true
		vim.g.molten_auto_open_output = false
	end,
	config = function()
		vim.g.molten_auto_init_behavior = "init"
		vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin") .. "/python3"

        -- To create a kernel which has access to project dependencies
        -- source the virtual environment
        -- run jupyter_create_project_kernel from ../../../bash/utilities.sh
	end,
}
